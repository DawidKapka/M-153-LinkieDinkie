use LinkieDinkie;

-- Create Users
insert into Users(username, firstName, lastName, email) values
('sunnybeach', 'Sunny', 'Beach', 'sunny.beach@gmail.com'),
('mountainhiker', 'Jack', 'Jones', 'jack.jones@gmail.com'),
('bookworm', 'Emily', 'Brown', 'emily.brown@gmail.com'),
('bikerchick', 'Laura', 'Smith', 'laura.smith@gmail.com'),
('techguru', 'John', 'Johnson', 'john.johnson@gmail.com'),
('foodie', 'Rachel', 'Davis', 'rachel.davis@gmail.com'),
('wanderlust', 'Sophia', 'Lee', 'sophia.lee@gmail.com'),
('travelbug', 'Ethan', 'Wilson', 'ethan.wilson@gmail.com'),
('musiclover', 'Lily', 'Clark', 'lily.clark@gmail.com'),
('coffeeaddict', 'Daniel', 'Rodriguez', 'daniel.rodriguez@gmail.com'),
('beachbum', 'Liam', 'Anderson', 'liam.anderson@gmail.com'),
('gymrat', 'Ava', 'Thomas', 'ava.thomas@gmail.com'),
('fitnessjunkie', 'Mia', 'Jackson', 'mia.jackson@gmail.com'),
('yogini', 'Aria', 'Martinez', 'aria.martinez@gmail.com'),
('moviebuff', 'Noah', 'Cooper', 'noah.cooper@gmail.com'),
('artlover', 'Olivia', 'Parker', 'olivia.parker@gmail.com'),
('fashionista', 'Isabella', 'Wright', 'isabella.wright@gmail.com'),
('gamer', 'James', 'King', 'james.king@gmail.com'),
('animallover', 'Sophia', 'Adams', 'sophia.adams@gmail.com'),
('sportsfanatic', 'Ethan', 'Phillips', 'ethan.phillips@icloud.com'),
('doja cat', 'Doja', 'Cat', 'dojacat@meow.com');

-- Create Groups
insert into Groups(groupName, groupDescription, isPublic) values
('Nature Lovers', 'A group for people who love spending time in nature and exploring the great outdoors.', 1),
('Coffee Enthusiasts', 'A community for coffee lovers to share their favorite brews, tips on brewing methods, and recommendations on coffee shops.', 1),
('Bookworms United', 'Join fellow book lovers in discussing the latest bestsellers, sharing reading lists, and recommending your favorite reads.', 1),
('DIY Fanatics', 'A group for DIY enthusiasts to share their latest projects, ask for advice, and showcase their skills.', 1),
('Movie Buffs', 'Join other film lovers in discussing your favorite movies, actors, and genres.', 1),
('Fitness Motivation', 'A community to share fitness tips, healthy recipes, and stay motivated in achieving your fitness goals.', 1),
('Art Appreciation', 'Discuss and appreciate art with other art lovers, share your favorite artists and paintings, and learn more about art history.', 1),
('Travel Junkies', 'A group for avid travelers to share their travel experiences, recommend destinations, and ask for travel advice.', 0),
('Pet Lovers', 'A community for pet owners to share their stories and experiences, seek advice on pet care, and recommend products.', 1),
('Cooking Corner', 'Join fellow foodies to share recipes, cooking tips, and recommend restaurants.', 1),
('Sports Fans', 'Discuss your favorite sports, teams, and players with other sports fans.', 1),
('Tech Talk', 'A group for tech enthusiasts to discuss the latest gadgets, software, and technology news.', 1),
('Photography Club', 'A community for amateur and professional photographers to share their photos, give feedback, and learn from others.', 1),
('Language Exchange', 'Practice speaking a foreign language with other language learners, get feedback, and improve your language skills.', 0),
('Movie Club', 'Join other movie lovers in watching and discussing movies together.', 0),
('Health and Wellness', 'A group to discuss health and wellness, share tips for self-care, and support each other in achieving a healthy lifestyle.', 1),
('Investing Insights', 'A community for investors to share their insights, discuss the stock market, and provide investment advice.', 0),
('Music Fans', 'Discuss and share your favorite music, bands, and concerts with other music fans.', 1),
('Gaming Community', 'Join fellow gamers to discuss the latest games, share gaming tips, and connect with other gamers.', 1),
('Entrepreneurship Club', 'A group for entrepreneurs to discuss business ideas, share success stories, and network with other entrepreneurs.', 1);

-- Add Users to Groups
insert into GroupUsers(fk_groupId, fk_userId) values
    (1, 1),
    (1, 3),
    (1, 4),
    (1, 8),
    (2, 13),
    (2, 18),
    (3, 1),
    (3, 9),
    (4, 15),
    (5, 3),
    (6, 8),
    (6, 19),
    (7, 3),
    (7, 4),
    (7, 21),
    (8, 1),
    (8, 7),
    (9, 6),
    (9, 11),
    (10, 10),
    (10, 12),
    (11, 11),
    (11, 9),
    (12, 1),
    (12, 19),
    (13, 20),
    (13, 19),
    (14, 14),
    (14, 4),
    (15, 5),
    (15, 6),
    (16, 5),
    (16, 7),
    (18, 1),
    (18, 3),
    (18, 9),
    (18, 11),
    (19, 11),
    (19, 15),
    (19, 20),
    (20, 1);

-- Create Posts
insert into Posts(creationDate, content, fk_groupId, fk_userId) values
    ('2023-05-01 10:00:00', 'Just got back from a hike in the mountains and saw some amazing wildlife. Here are some of the pictures I took!', 1, 1),
    ('2023-05-03 15:30:00', 'I''m planning a camping trip for next weekend and I''m looking for some good spots to check out. Any recommendations?',1, 8),
    ('2023-05-02 09:15:00', 'I just tried a new coffee shop and had the best latte ever! Has anyone else been there?', 2, 13),
    ('2023-05-03 13:45:00', 'I''m trying to perfect my pour-over technique. Any tips on getting the perfect extraction?', 2, 18),
    ('2023-05-01 16:00:00', 'Just finished reading "The Nightingale" and it was amazing! Has anyone else read it?', 3, 1),
    ('2023-05-03 11:30:00', 'I''m looking for some new books to read. Any recommendations?', 3, 1),
    ('2023-05-01 20:00:00', 'Just watched "Parasite" for the first time and it blew my mind! Has anyone else seen it?', 5, 3),
    ('2023-05-03 19:30:00', 'I''m in the mood for a good action movie. Any recommendations?', 5, 3),
    ('2023-05-03 10:00:00', 'Just finished a 5k run! Feeling great and ready to take on the day! #FitnessGoals #HealthyLifestyle', 6, 19),
    ('2023-05-02 18:45:00', 'Visited the Louvre Museum in Paris yesterday and saw the Mona Lisa in person. It was an amazing experience! #ArtAppreciation #Travel', 7, 4),
    ('2023-04-30 12:15:00', 'I just finished reading a book about Michelangelo and his works. It was so interesting to learn about his life and artistic process. #ArtHistory #BookRecommendation', 7, 3),
    ('2023-05-01 09:00:00', 'Just booked a trip to Japan for the summer! I can''t wait to try all the delicious food and explore the culture. #TravelGoals #Japan', 8, 1),
    ('2023-05-03 13:45:00', 'My dog just learned a new trick! She can now play dead on command. #ProudPetParent #DogTricks', 9, 11),
    ('2023-04-29 11:00:00', 'I just got a new kitten and she is so adorable! I''m having a hard time coming up with a name though. Any suggestions? #CatLovers #NewKitten', 9, 11),
    ('2023-05-02 20:00:00', 'Just tried a new recipe for chicken parmesan and it turned out amazing! So much better than takeout. #HomeCooking #Foodie', 10, 10),
    ('2023-04-26 16:30:00', 'I recently discovered a new Thai restaurant in my neighborhood and it has become my new favorite spot. The pad thai and mango sticky rice are to die for! #FoodRecommendation #ThaiFood', 10, 12),
    ('2023-05-03 10:30:00', 'What''s your favorite sports moment of all time? Share it with us in the comments!', 11, 11),
    ('2023-05-02 15:45:00', 'Anyone else excited for the playoffs? Who do you think will take home the trophy?', 11, 9),
    ('2023-05-01 08:00:00', 'Have you tried the latest Apple products yet? What do you think of them?', 12, 1),
    ('2023-04-30 12:20:00', 'What technology trends are you excited about? Share your thoughts with us!', 12, 19),
    ('2023-04-29 16:00:00', 'Check out this photo I took during my last trip! What do you think?', 13, 20),
    ('2023-04-28 09:15:00', 'I''m thinking of upgrading my camera. Any recommendations on a good one for travel photography?', 13, 19),
    ('2023-04-27 14:30:00', 'Bonjour! Je cherche quelqu''un avec qui pratiquer mon français. Quelqu''un est intéressé?', 14, 4),
    ('2023-04-26 11:45:00', 'I''m looking for someone to practice Spanish with. Anyone interested in doing a language exchange?', 14, 4),
    ('2023-04-25 17:00:00', 'Have you watched any good movies lately? Share your recommendations with us!', 15, 6),
    ('2023-04-24 13:20:00', 'Let''s watch a movie together! Any suggestions on what to watch?', 15, 5),
    ('2023-04-24 19:00:00', 'Wow, that''s creative! What was your inspiration for this outfit?', 7, 4);

-- Create Comments
insert into Comments(creationDate, content, fk_postId, fk_userId) values
    ('2023-05-01 12:20:00', 'Wow! That''s amazing!', 1, 4),
    ('2023-05-03 08:00:00', 'Oh god, those are some awful photos :O', 1, 3),
    ('2023-05-10 09:12:30', 'I completely agree with your viewpoint.', 2, 1),
    ('2023-05-10 09:18:15', 'This is a great idea!', 4, 13),
    ('2023-05-10 09:24:57', 'I think you''re missing a crucial point here.', 5, 9),
    ('2023-05-10 09:32:43', 'Can you provide some evidence to support your claim?', 3, 18),
    ('2023-05-10 09:38:21', 'I don''t agree with you on this topic.', 1, 8),
    ('2023-05-10 09:45:02', 'That''s a good point, but have you considered the following...?', 4, 13),
    ('2023-05-10 09:52:18', 'I''m not sure I understand what you''re trying to say.', 2, 4),
    ('2023-05-10 09:58:57', 'Interesting perspective, but I think there''s another side to it.', 5, 9),
    ('2023-05-10 10:05:13', 'Great post! I learned a lot.', 3, 18),
    ('2023-05-10 10:12:06', 'I disagree with your conclusion, but I respect your opinion.', 1, 4),
    ('2023-05-10 10:19:42', 'I''m curious about your sources. Can you share them with us?', 2, 4),
    ('2023-05-10 10:26:31', 'This is a really important issue that needs to be addressed.', 4, 13),
    ('2023-05-10 10:33:24', 'I think you''ve made some valid points, but I''m not convinced.', 12, 7),
    ('2023-05-10 10:40:51', 'I appreciate your thoughtful analysis.', 11, 4),
    ('2023-05-10 10:47:29', 'I strongly disagree with your perspective.', 9, 8),
    ('2023-05-10 10:54:18', 'Thank you for sharing your insights.', 6, 9),
    ('2023-05-10 11:01:05', 'I think this is a complicated issue with no easy answers.', 4, 13),
    ('2023-05-10 11:07:52', 'I''m not sure I agree with your interpretation of the data.', 15, 12),
    ('2023-04-24 19:01:55', 'Meowwww', 27, 21);

-- Create Ratings
insert into Ratings(rating, fk_postId, fk_userId) values
  (4.0, 2, 1),
  (3.5, 2, 3),
  (5.0, 1, 2),
  (4.0, 3, 4),
  (3.5, 2, 5),
  (2.5, 1, 3),
  (4.5, 3, 2),
  (3.0, 2, 4),
  (4.0, 1, 5),
  (3.5, 3, 1),
  (4.0, 1, 4),
  (2.5, 2, 2),
  (3.0, 3, 3),
  (4.5, 1, 3),
  (3.5, 2, 5),
  (4.0, 1, 2),
  (3.0, 3, 4),
  (2.5, 2, 1),
  (4.5, 3, 5),
  (3.5, 1, 4);
