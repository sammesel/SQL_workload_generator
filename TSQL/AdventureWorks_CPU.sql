--USE AdventureWorksPTO
--go

declare @loops int = 0
declare @i int = 0
declare @search char(1) 

while @loops < 100
begin

	while @i <= 26
		begin
			set @search = char(65+32+@i)
			exec test.EmployeeByLastName @search
			exec test.EmployeeByFirstName @search
			exec test.EmployeeDepartmentHistoryByFirstName @search
			exec test.EmployeeDepartmentHistoryByLastName @search
			exec test.ProductAndDescriptionByKeyword @search
			set @i = @i + 1
		end
		set @loops = @loops + 1
end
