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
INSERT INTO [dbo].[Games] ([name], [listedPrice], [discountPrice], [imageURL]) 
VALUES 
    (N'Brawl Halla', 36, 24, N'categories-01.jpg'),
    (N'Dota 2', 32, 22, N'categories-02.jpg'),
    (N'Tower Of Fantasy', 45, 31, N'categories-03.jpg'),
    (N'STAR WARS™: Battlefront Classic Collection', 20, 18, N'hero-capsule.jpg'),
    (N'NBA 2K24', 50, 8, N'nba-2k24.jpg'),
    (N'Slay the Spire', 15, 5, N'slay-the-spire.jpg'),
    (N'Mount & Blade II: Bannerlord', 40, 24, N'mount-blade-bannerlord.jpg'),
    (N'Sid Meier’s Civilization® VI', 35, 4, N'sid-meier-civilization.jpg'),
    (N'MARVEL SNAP', 3, 2, N'marvel-snap.jpg'),
    (N'Shadowverse CCG', 10, 5, N'shadowverse-ccg.jpg'),
    (N'Wizard101', 3, 2, N'wizard101.jpg');
GO

INSERT INTO [dbo].[Categories] ([name]) 
VALUES 
    (N'Action'),
    (N'Adventure'),
    (N'Role-playing'),
    (N'Strategy'),
    (N'Sports');
GO

INSERT INTO [dbo].[Game_Category] ([gameId], [categoryId]) 
VALUES 
    (1, 3),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 3),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 5),
    (5, 2),
    (6, 1),
    (6, 2),
    (7, 2),
    (7, 4),
    (7, 5),
    (8, 1),
    (8, 2),
    (9, 2),
    (9, 5),
    (10, 1),
    (10, 3),
    (11, 4),
    (11, 5);
GO

INSERT INTO [dbo].[GameDetails] ([gameId], [introduction], [description]) 
VALUES 
    (1, N'Brawlhalla is a free 2D platform fighting game that supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android! History''s greatest warriors brawl to prove who''s the best in an epic test of strength and skill.', N'Brawlhalla is a free-to-play platform fighting game developed by Blue Mammoth Games. It was originally released for macOS, PlayStation 4, and Windows in 2017, with ports for Nintendo Switch, Xbox One, Android, and iOS released later. The game supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS, and Android. Players choose from a list of 50+ fighters called Legends and duke it out on various stages.'),
    (2, N'Dota is the undisputed granddaddy of all multiplayer online battle arena (MOBA) games, having started the genre itself as a mod for Warcraft III in the early 2000s. The game has greatly evolved since then to become what is now Dota 2, though it remains far and away the most in-depth and complex of all the MOBAs.', N'Dota 2 is a multiplayer online battle arena (MOBA) video game by Valve. It is a sequel to Defense of the Ancients (DotA), a community-created mod for Blizzard Entertainment''s Warcraft III: Reign of Chaos. In Dota 2, players team up in two sets of five, each controlling one of many Heroes to take out the enemy base. The game was released in July 2013.'),
    (3, N'Tower of Fantasy is a free-to-play open world action role-playing game developed by Hotta Studio, a subsidiary of Perfect World. The game is set in the far future on the extraterrestrial planet "Aida"?', N'Tower of Fantasy is a 3D "shared world" action role-playing game. It is an open-world game made in the style of Genshin Impact. The game features a high degree of freedom in world exploration, a scrappy sci-fi art style, interactive puzzle elements, and a fast combat feel. The player controls a customizable character avatar who interacts with non-player characters and other entities and collects items as they travel around in the open virtual world.'),
    (4, N'Random introduction for Game 4', N'Long random description for Game 4'),
    (5, N'Random introduction for Game 5', N'Long random description for Game 5'),
    (6, N'Random introduction for Game 6', N'Long random description for Game 6'),
    (7, N'Random introduction for Game 7', N'Long random description for Game 7'),
    (8, N'Random introduction for Game 8', N'Long random description for Game 8'),
    (9, N'Random introduction for Game 9', N'Long random description for Game 9'),
    (10, N'Random introduction for Game 10', N'Long random description for Game 10'),
    (11, N'Random introduction for Game 11', N'Long random description for Game 11');
GO

INSERT INTO [dbo].[Users] ([name], [email], [password]) 
VALUES 
    (N'Vũ Hồng Quang', N'quang@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Hoàng Thái', N'thai@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Trần Đình Quí', N'qui@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn An', N'an@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Bình', N'binh@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Cẩn', N'can@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Dũng', N'dung@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Em', N'em@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Fight', N'fight@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb'),
    (N'Nguyễn Văn Gà', N'ga@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb');
GO

INSERT INTO [dbo].[Roles] ([userId], [role]) 
VALUES 
    (1, N'admin'),
    (2, N'user'),
    (3, N'user'),
    (4, N'user'),
    (5, N'user'),
    (6, N'user'),
    (7, N'user'),
    (8, N'user'),
    (9, N'user'),
    (10, N'user');
GO

INSERT INTO [dbo].[Orders] ([userId], [orderDate]) 
VALUES 
    (1, CAST(N'2024-03-08T00:23:39.010' AS DateTime)),
    (3, CAST(N'2024-03-08T00:24:33.930' AS DateTime)),
    (2, CAST(N'2024-03-08T00:24:58.517' AS DateTime)),
    (9, CAST(N'2024-02-29T02:33:04.000' AS DateTime)),
    (7, CAST(N'2024-01-08T02:33:36.000' AS DateTime));

INSERT INTO [dbo].[CartItems] ([userId], [gameId], [quantity], [status]) 
VALUES 
    (1, 1, 1, N'buyed'),
    (1, 7, 1, N'buyed'),
    (1, 9, 1, N'buyed'),
    (3, 1, 1, N'buyed'),
    (3, 2, 1, N'buyed'),
    (3, 3, 1, N'buyed'),
    (3, 4, 1, N'buyed'),
    (3, 5, 1, N'buyed'),
    (3, 6, 1, N'buyed'),
    (3, 7, 1, N'buyed'),
    (3, 8, 1, N'buyed'),
    (3, 9, 1, N'buyed'),
    (3, 10, 1, N'buyed'),
    (3, 11, 1, N'buyed'),
    (2, 1, 1, N'buyed'),
    (9, 9, 1, N'buyed'),
    (9, 7, 1, N'buyed'),
    (7, 8, 1, N'buyed'),
    (7, 5, 1, N'buyed');


INSERT INTO [dbo].[OrderItems] ([orderId], [cartItemId], [price]) 
VALUES 
    (1, 1, 24),
    (1, 2, 24),
    (1, 3, 2),
    (2, 4, 24),
    (2, 5, 22),
    (2, 6, 31),
    (2, 7, 18),
    (2, 8, 8),
    (2, 9, 5),
    (2, 10, 24),
    (2, 11, 4),
    (2, 12, 2),
    (2, 13, 5),
    (2, 14, 2),
    (3, 15, 24),
    (4, 16, 2),
    (4, 17, 24),
    (5, 18, 4),
    (5, 19, 8);

