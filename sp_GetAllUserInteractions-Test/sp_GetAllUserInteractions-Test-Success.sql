-- Successful case: Returns query with all interactions by user with the id 1

declare @userId int 
select @userId = 1

exec sp_GetAllUserInteractions @userId

-- expected result: 3 tables with 5 posts, 1 comment and 4 ratings