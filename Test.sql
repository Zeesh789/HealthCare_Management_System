use dbHealthCareManagement
go

alter proc Proc_testOrderMedicine
@userid int,
@appointid int
as
begin
	set nocount on
	begin tran OrderTransaction
	
		IF EXISTS (			-- Checking if the USERID and APPOINTMENTID is correct
		SELECT 1
		FROM Prescription
		join Appointment
		on Prescription.AppointmentID = Appointment.AppointmentID
		WHERE Prescription.AppointmentID = @appointid and Appointment.PatientID = @userid)
		begin
			Declare @medid int
			declare @medam int
			declare OrderCursor cursor for
			select	MedicineID,MedicineAmount from Prescription where AppointmentID =  @appointid

			open OrderCursor
			fetch next from OrderCursor into @medid,@medam		--First Fetch
			while (@@FETCH_STATUS = 0)							-- Setting limit for cursor
			Begin
				IF EXISTS (
				SELECT 1
				FROM Medicine M
				join Prescription P
				on M.MedicineID = P.MedicineID and P.AppointmentID = @appointid)
				begin
					if exists(								-- Checking the Stock of medicine
					select 1
					from Medicine
					where @medam <= MedStock and @medid = MedicineID)
					begin
						update Medicine		-- Updating the medicine table according to the  demands
						set MedStock = MedStock - @medam
						where @medid = MedicineID
						Insert into MedOrder(AppointmentID,OrderStatus)
						values(@appointid,'Successfull')
						
					end
					else 
					begin
						print 'Order Failed. Medicine Out of Stock!'						
						close ordercursor
						deallocate ordercursor
						rollback tran OrderTransaction
						--update MedOrder
						--set OrderStatus = 'Failed'
						--where Transaction_Time = cast(GETDATE() as DATETIME2(0))
						Insert into MedOrder(AppointmentID,OrderStatus)
						values(@appointid,'Failed')
						return
					end					
				end
				fetch next from OrderCursor into @medid,@medam
			end
			close ordercursor
			deallocate ordercursor
			Select top 1 AppointmentID,OrderStatus from MedOrder where AppointmentID = @appointid
			group by AppointmentID,OrderStatus,Transaction_Time
			order by Transaction_Time desc
			print 'Order Successfull!'
		end
		else
		begin
			print ' Invalid Appointment ID!'
			rollback tran OrderTransaction
			return
		end	
		waitfor delay '00:00:02'
	commit tran OrderTransaction
end

exec Proc_testOrderMedicine @userid= 12, @appointid = 18
exec proc_viewMedicineTable 

select * from MedOrder
