/**************************************************************
    Script Name         : Proc_View_Doctor_Slots.sql
    Purpose             : Creating Stored Procedure for Viewing Doctor slots 
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 17/04/26
    Modified            : Updated Version 1 
****************************************************************/

use dbHealthCareManagement
go


------------------------------------------------------------
-- Procedure
------------------------------------------------------------

alter proc Proc_View_Doctor_Slots
@specialization nvarchar(30) = NULL,
@date nvarchar(10) = NULL,
@Status nvarchar(15) = NULL
as
begin 
	begin try
		if lower(@Status) = 'available' set @Status = 'available'
		else if lower(@Status) = 'not available' set @Status = 'not available'
		else if lower(@Status) is null set @Status = null
		else begin Print 'INVALID STATUS!' return end 
		
		if lower(@specialization) in ('cardiology','orthopedics','dermatology','general physician')
		begin 
			set @specialization = @specialization
		end
		else if lower(@specialization) is null set @specialization = null
		else begin Print 'INVALID Specialization!' return end

		set @date = CONVERT(date,@date,23)

		select * from vw_Doctor_Slots
		where specialization = isnull(@specialization,specialization) 
		and date = isnull(@date,Date)
		and Status =  isnull(@Status,Status)
	end try
	begin catch
			--print error_message()
			if Error_message() like '%Conversion failed when converting date and/or time from character string.%'
			begin
			print 'Invalid Date! Please Enter date in YYYY-MM-DD format.'
			end
	end catch
end

------------------------------------------------------------
-- Test Cases
------------------------------------------------------------
exec Proc_View_Doctor_Slots @specialization = 'cardiology',@status = 'Available',@date = '20'
dbcc opentran()