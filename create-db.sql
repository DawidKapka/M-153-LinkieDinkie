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