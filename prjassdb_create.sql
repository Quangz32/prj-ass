-- Active: 1709015678988@@127.0.0.1@1433@prjassdb
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


-- INSERT DATAAAAAAAAAAAAAA
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
       ('Tower Of Fantasy', 45, 31, 'categories-03.jpg');
GO

INSERT INTO Game_Category (gameId, categoryId)
VALUES (1, 2),
       (1, 3),
       (2, 1),
       (3, 1),
       (3, 2),
       (3, 3);
GO

INSERT INTO GameDetails
VALUES (1, 'Brawlhalla is a free 2D platform fighting game that supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android! History''s greatest warriors brawl to prove who''s the best in an epic test of strength and skill.', 'Brawlhalla is a free-to-play platform fighting game1234developed by Blue Mammoth Games. It was originally released for macOS, PlayStation 4 and Windows in 2017, with ports for Nintendo Switch, Xbox One, Android and iOS released later2. The game supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android1. Players choose from a list of 50+ fighters called Legends and duke it out on various platforms (stages)'),
       (2, 'Dota is the undisputed granddaddy of all multiplayer online battle arena (MOBA) games, having started the genre itself as a mod for Warcraft III in the early 2000’s. The game has greatly evolved since then to become what is now Dota 2, though it remains far and away the most in-depth and complex of all the MOBAs.', 'Dota 2 is a multiplayer online battle arena (MOBA) video game by Valve1234. It is a sequel to Defense of the Ancients (DotA), a community-created mod for Blizzard Entertainment''s Warcraft III: Reign of Chaos1. In Dota 2, players team up in two sets of five, each controlling one of many Heroes to take out the enemy base23. The game was released in July 20134.'),
       (3, 'Tower of Fantasy is a free-to-play open world action role-playing game developed by Hotta Studio, a subsidiary of Perfect World. The game is set in the far future on the extraterrestrial planet "Aida"…','Tower of Fantasy is a 3D "shared world" action role-playing game1. It is an open-world game made in the style of Genshin Impact2. The game features a high degree of freedom in world exploration, a scrappy sci-fi art style, interactive puzzle elements, and fast combat feel3. The player controls a customizable character avatar who interacts with non-player characters and other entities and collects items as they travel around in the open virtual world1.');
GO
