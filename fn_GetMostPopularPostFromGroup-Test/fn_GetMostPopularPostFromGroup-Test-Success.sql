-- Successful case: should return the content of the most popular post in a group

declare @groupId int
select @groupId = 1;

select @groupId as 'Group Id', dbo.fn_GetMostPopularPostFromGroup(@groupId) as 'Most Popular Post';
-- expected result: table with a groupId and the content of the most popular post