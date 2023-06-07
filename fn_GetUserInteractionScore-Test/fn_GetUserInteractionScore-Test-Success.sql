-- Successful case: should return the total Interaction Score of each user

select userId, username, dbo.fn_GetUserInteractionScore(userId) as 'InteractionScore' from Users order by InteractionScore desc;
-- expected result: table with a userId, username and InteractionScore for each user in DB