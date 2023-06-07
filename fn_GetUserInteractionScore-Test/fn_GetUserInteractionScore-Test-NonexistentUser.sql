-- Failing case: should return NULL when user does not exist


select dbo.fn_GetUserInteractionScore(99) as 'Interaction Score';

-- expected result: table with NULL as Interaction Score