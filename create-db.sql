use master;
drop database if exists LinkieDinkie;
create database LinkieDinkie;
go

use LinkieDinkie;

create table Groups(
    groupId int identity,
    groupName varchar(max) not null,
    groupDescription varchar(max),
    isPublic bit not null,
    primary key (groupId)
);

create table Users(
    userId int identity,
    username varchar(max) not null,
    firstname varchar(max) not null,
    lastname varchar(max) not null,
    email varchar(max) not null,
    primary key (userId)
);

create table Posts(
    postId int identity,
    creationDate datetime not null,
    content varchar(max) not null,
    fk_userId int not null,
    fk_groupId int not null,
    primary key (postId),
);

create table Comments(
    commentId int identity,
    creationDate datetime not null,
    content varchar(max) not null,
    fk_userId int not null,
    fk_postId int not null,
    primary key (commentId),
);

create table Ratings(
    ratingId int identity,
    rating float not null,
    fk_postId int not null,
    fk_userId int not null,
    primary key (ratingId),
)

create table GroupUsers(
    groupUserId int identity,
    fk_groupId int not null,
    fk_userId int not null
)

alter table Posts add 
    foreign key (fk_userId) references Users(userId),
    foreign key (fk_groupId) references Groups(groupId);

alter table Comments add 
    foreign key (fk_userId) references Users(userId),
    foreign key (fk_postId) references Posts(postId);

alter table Ratings add 
    foreign key (fk_postId) references Posts(postId),
    foreign key (fk_userId) references Users(userId);

alter table GroupUsers add 
    foreign key (fk_groupId) references Groups(groupId),
    foreign key (fk_userId) references Users(userId);

go

create procedure sp_BanUser
    @userId int
as 
begin
    if not exists (select 1 from Users where Users.userId = @userId) 
        throw 50000, 'User existiert nicht!', 1;

    -- delete all ratings made by user
    delete from Ratings where fk_userId = @userId;

    -- delete all ratings from posts made by user
    delete from Ratings where ratingId in (
        select ratingId from Ratings where fk_postId in (
            select postId from Posts where fk_userId = @userId
        )
    );
    
    -- delete all comments made by user
    delete from Comments where fk_userId = @userId;

    -- delete all comments from posts made by user
    delete from Comments where commentId in (
        select commentId from Comments where fk_postId in (
            select postId from Posts where fk_userId = 1
        )
    );
    
    -- delete all posts made by user
    delete from Posts where fk_userId = @userId;

    -- delete user from all groups
    delete from GroupUsers where fk_userId = @userId;

    -- delete user
    delete from Users where userId = @userId;

    return @@ROWCOUNT
end

go

-- get all comments, posts and ratings of user
create procedure sp_GetAllUserInteractions
    @userId int
as
begin
    if not exists (select 1 from Users where Users.userId = @userId)
    -- user not existing
        throw 50000, 'User existiert nicht!', 1;
    select * from Posts where fk_userId = @userId;
    select * from Comments where fk_userId = @userId;
    select * from Ratings where fk_userId = @userId;
end

go

-- get amount of user interaction points
-- each post = 10pts
-- each comment = 5pts
-- each rating = 2pts
create function fn_GetUserInteractionScore(
    @userId int
) returns int as
begin 
    if not exists (select 1 from Users where Users.userId = @userId)
        return null;

    declare @postAmount int
    declare @commentAmount int
    declare @ratingAmount int 

    -- get amount of posts created by user
    select @postAmount = count(*) from Posts where Posts.fk_userId = @userId;

    -- get amount of comments created by user
    select @commentAmount = count(*) from Comments where Comments.fk_userId = @userId;

    -- get amount of ratings created by user
    select @ratingAmount = count(*) from Ratings where Ratings.fk_userId = @userId;

    return 
    (@postAmount * 10) + -- 10pts/post
    (@commentAmount * 5) + -- 5pts/comment
    (@ratingAmount * 2); -- 2pts/rating
end