-- Successful case: SP should delete all traces of an existing user

-- Prepare Data
insert into Users (username, firstname, lastname, email) values ('testuser', 'Test', 'User', 'test@test.com');

declare @userId int
select @userId = userId from Users where username = 'testuser';

insert into GroupUsers (fk_groupId, fk_userId) values (1, @userId);
insert into Posts (creationDate, content, fk_userId, fk_groupId) values ('2023-01-01T00:00:00', 'Test Post', @userId, 1);

declare @postId int 
select @postId = postId from Posts where fk_userId = @userId;

insert into Comments (creationDate, content, fk_userId, fk_postId) values ('2023-01-01T00:00:00', 'Comment by test user', @userId, 1);
insert into Comments (creationDate, content, fk_userId, fk_postId) values ('2023-01-01T00:00:00', 'Comment on test users post', 1, @postId);

insert into Ratings (rating, fk_postId, fk_userId) values (5, 1, @userId);
insert into Ratings (rating, fk_postId, fk_userId) values (5, @userId, 1);

-- execute procedure
exec sp_BanUser @userId;

-- expected result: the following queries should all be empty
select * from Users where userId = @userId;
select * from GroupUsers where fk_userId = @userId;
select * from Posts where fk_userId = @userId;
select * from Comments where fk_userId = @userId or fk_postId = @postId;
select * from Ratings where fk_userId = @userId or fk_postId = @postId;