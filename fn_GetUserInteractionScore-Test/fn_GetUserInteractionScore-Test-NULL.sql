-- Failing case: should return NULL when userId passed is NULL

select dbo.fn_GetUserInteractionScore(NULL) as 'Interaction Score';
-- expected result: table containing NULL as Interaction Score