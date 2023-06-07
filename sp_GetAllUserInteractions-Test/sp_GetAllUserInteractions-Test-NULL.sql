-- Error case: should throw an error when NULL passed as userId

declare @userId int 
select @userId = NULL

exec sp_GetAllUserInteractions @userId;

-- expected result: Error Message "userId kann nicht NULL sein!"