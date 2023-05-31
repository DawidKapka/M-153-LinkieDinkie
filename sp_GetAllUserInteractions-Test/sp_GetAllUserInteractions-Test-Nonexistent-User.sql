-- Error case: should throw an error when id of nonexistent user passed

declare @userId int 
select @userId = 99

exec sp_GetAllUserInteractions @userId;

-- expected result: Error Message "User existiert nicht!"

