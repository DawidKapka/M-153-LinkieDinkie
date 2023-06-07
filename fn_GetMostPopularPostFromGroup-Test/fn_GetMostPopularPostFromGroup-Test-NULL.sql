-- Fail case: should return NULL if passed groupId is NULL

declare @groupId int
select @groupId = NULL;

select @groupId as 'Group Id', dbo.fn_GetMostPopularPostFromGroup(@groupId) as 'Most Popular Post';
-- expected result: table with NULL