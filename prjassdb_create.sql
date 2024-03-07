-- Active: 1709015678988@@127.0.0.1@1433@master

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'prjassdb')
BEGIN
  ALTER DATABASE prjassdb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE prjassdb;
END
GO

CREATE DATABASE prjassdb;
GO

USE prjassdb;
GO

CREATE TABLE Users (
  id INT IDENTITY(1,1) PRIMARY KEY,
  [name] NVARCHAR(64),
  email NVARCHAR(64),
  [password] NVARCHAR(128)
);
GO

CREATE TABLE Categories (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(64)
);
GO

CREATE TABLE Games (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(64),
  listedPrice INT,
  discountPrice INT,
  imageURL NVARCHAR(64)
);
GO

CREATE TABLE Game_Category (
  gameId INT,
  categoryId INT,
  PRIMARY KEY (gameId, categoryId),
  FOREIGN KEY (gameId) REFERENCES Games(id),
  FOREIGN KEY (categoryId) REFERENCES Categories(id)
);
GO

CREATE TABLE GameDetails (
  gameId INT,
  introduction NVARCHAR(1024),
  [description] NVARCHAR(2048),
  PRIMARY KEY (gameId),
  FOREIGN KEY (gameId) REFERENCES Games(id)
);
GO

CREATE TABLE CartItems (
  id INT IDENTITY(1,1) PRIMARY KEY,
  userId INT,
  gameId INT,
  quantity INT,
  [status] NVARCHAR(32),
  FOREIGN KEY (gameId) REFERENCES Games(id),
  FOREIGN KEY (userID) REFERENCES Users(id),
);

GO
CREATE TABLE Orders (
  id INT IDENTITY(1,1) PRIMARY KEY,
  userId INT,
  orderDate DATETIME,
  FOREIGN KEY (userId) REFERENCES Users(id)
);
GO

CREATE TABLE OrderItems (
  id INT IDENTITY(1,1) PRIMARY KEY,
  orderId INT,
  cartItemId INT,
  price INT,
  FOREIGN KEY (orderId) REFERENCES Orders(id),
  FOREIGN KEY (cartItemId) REFERENCES CartItems(id)
);
GO

CREATE TABLE Feedbacks (
  id INT IDENTITY(1,1) PRIMARY KEY,
  userId INT,
  gameId INT,
  content NVARCHAR(1024),
  FOREIGN KEY (userId) REFERENCES Users(id),
  FOREIGN KEY (gameId) REFERENCES Games(id)
);
GO

CREATE TABLE Roles(
	userId INT PRIMARY KEY,
	[role] NVARCHAR(32),	--'admin' / 'user'
	FOREIGN KEY (userId) REFERENCES Users(id)
);
GO


-- INSERT DATAAAAAAAAAAAAAA

INSERT INTO Users ([name], email, [password])
VALUES (N'Vũ Hồng Quang', 'quang@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Hoàng Thái', 'thai@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Trần Đình Quí', 'qui@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       -- Random user
       (N'Nguyễn Văn An', 'an@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Bình', 'binh@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Cẩn', 'can@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Dũng', 'dung@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Em', 'em@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Fight', 'fight@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
       (N'Nguyễn Văn Gà', 'ga@gmail.com', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb');
GO

INSERT INTO Roles (userId, [role]) VALUES
	(1,'admin'),
	(2,'user'),
	(3,'user'),
	(4,'user'),
	(5,'user'),
	(6,'user'),
	(7,'user'),
	(8,'user'),
	(9,'user'),
	(10,'user');
GO

INSERT INTO Categories (name) VALUES
  ('Action'),
  ('Adventure'),
  ('Role-playing'),
  ('Strategy'),
  ('Sports');
GO

INSERT INTO Games (name, listedPrice, discountPrice, imageURL)
VALUES ('Brawl Halla', 36, 24, 'categories-01.jpg'),
       ('Dota 2', 32, 22, 'categories-02.jpg'),
       ('Tower Of Fantasy', 45, 31, 'categories-03.jpg'),
       ('STAR WARS™: Battlefront Classic Collection', 20, 18, 'hero-capsule.jpg'),
       ('NBA 2K24',50, 8,'nba-2k24.jpg'),
       ('Slay the Spire',15,5,'slay-the-spire.jpg'),
       ('Mount & Blade II: Bannerlord',40,24,'mount-blade-bannerlord.jpg'),
       ('Sid Meier’s Civilization® VI', 35, 4, 'sid-meier-civilization.jpg'),
       ('MARVEL SNAP',3,2,'marvel-snap.jpg'),
       ('Shadowverse CCG', 10,5,'shadowverse-ccg.jpg'),
       ('Wizard101',3,2,'wizard101.jpg');
GO

INSERT INTO Game_Category (gameId, categoryId)
VALUES 
(1, 3),
(2, 4),
(2, 5),
(2, 3),
(3, 5),
(3, 4),
(3, 3),
(4, 1),
(4, 5),
(5, 2),
(6, 2),
(6, 1),
(7, 2),
(7, 4),
(7, 5),
(8, 2),
(8, 1),
(9, 2),
(9, 5),
(10, 1),
(10, 3),
(11, 5),
(11, 4);

GO

INSERT INTO GameDetails
VALUES	(1, 'Brawlhalla is a free 2D platform fighting game that supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android! History''s greatest warriors brawl to prove who''s the best in an epic test of strength and skill.', 'Brawlhalla is a free-to-play platform fighting game1234developed by Blue Mammoth Games. It was originally released for macOS, PlayStation 4 and Windows in 2017, with ports for Nintendo Switch, Xbox One, Android and iOS released later2. The game supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android1. Players choose from a list of 50+ fighters called Legends and duke it out on various platforms (stages)'),
		(2, 'Dota is the undisputed granddaddy of all multiplayer online battle arena (MOBA) games, having started the genre itself as a mod for Warcraft III in the early 2000�s. The game has greatly evolved since then to become what is now Dota 2, though it remains far and away the most in-depth and complex of all the MOBAs.', 'Dota 2 is a multiplayer online battle arena (MOBA) video game by Valve1234. It is a sequel to Defense of the Ancients (DotA), a community-created mod for Blizzard Entertainment''s Warcraft III: Reign of Chaos1. In Dota 2, players team up in two sets of five, each controlling one of many Heroes to take out the enemy base23. The game was released in July 20134.'),
		(3, 'Tower of Fantasy is a free-to-play open world action role-playing game developed by Hotta Studio, a subsidiary of Perfect World. The game is set in the far future on the extraterrestrial planet "Aida"�','Tower of Fantasy is a 3D "shared world" action role-playing game1. It is an open-world game made in the style of Genshin Impact2. The game features a high degree of freedom in world exploration, a scrappy sci-fi art style, interactive puzzle elements, and fast combat feel3. The player controls a customizable character avatar who interacts with non-player characters and other entities and collects items as they travel around in the open virtual world1.'),
		(4, 'Random introduction for Game 4', 'Long random description for Game 4'),
		(5, 'Random introduction for Game 5', 'Long random description for Game 5'),
		(6, 'Random introduction for Game 6', 'Long random description for Game 6'),
		(7, 'Random introduction for Game 7', 'Long random description for Game 7'),
		(8, 'Random introduction for Game 8', 'Long random description for Game 8'),
		(9, 'Random introduction for Game 9', 'Long random description for Game 9'),
		(10, 'Random introduction for Game 10', 'Long random description for Game 10'),
		(11, 'Random introduction for Game 11', 'Long random description for Game 11');

GO
