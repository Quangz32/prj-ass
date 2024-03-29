USE [master]
GO
/****** Object:  Database [prjassdb]    Script Date: 3/8/2024 2:39:32 AM ******/
CREATE DATABASE [prjassdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prjassdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prjassdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prjassdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prjassdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [prjassdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prjassdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prjassdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prjassdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prjassdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prjassdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prjassdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [prjassdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prjassdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prjassdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prjassdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prjassdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prjassdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prjassdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prjassdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prjassdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prjassdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prjassdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prjassdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prjassdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prjassdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prjassdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prjassdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prjassdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prjassdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prjassdb] SET  MULTI_USER 
GO
ALTER DATABASE [prjassdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prjassdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prjassdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prjassdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prjassdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prjassdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prjassdb] SET QUERY_STORE = OFF
GO
USE [prjassdb]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[gameId] [int] NULL,
	[quantity] [int] NULL,
	[status] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[gameId] [int] NULL,
	[content] [nvarchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Category]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Category](
	[gameId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gameId] ASC,
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDetails]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDetails](
	[gameId] [int] NOT NULL,
	[introduction] [nvarchar](1024) NULL,
	[description] [nvarchar](2048) NULL,
PRIMARY KEY CLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NULL,
	[listedPrice] [int] NULL,
	[discountPrice] [int] NULL,
	[imageURL] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[cartItemId] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[orderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[userId] [int] NOT NULL,
	[role] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/8/2024 2:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NULL,
	[email] [nvarchar](64) NULL,
	[password] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (1, 1, 1, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (2, 1, 7, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (3, 1, 9, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (4, 3, 1, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (5, 3, 2, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (6, 3, 3, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (7, 3, 4, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (8, 3, 5, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (9, 3, 6, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (10, 3, 7, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (11, 3, 8, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (12, 3, 9, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (13, 3, 10, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (14, 3, 11, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (15, 2, 1, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (16, 9, 9, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (17, 9, 7, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (18, 7, 8, 1, N'buyed')
INSERT [dbo].[CartItems] ([id], [userId], [gameId], [quantity], [status]) VALUES (19, 7, 5, 1, N'buyed')
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Action')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Adventure')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Role-playing')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Strategy')
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Sports')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (1, 3)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (2, 3)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (2, 4)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (2, 5)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (3, 3)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (3, 4)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (3, 5)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (4, 1)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (4, 5)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (5, 2)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (6, 1)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (6, 2)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (7, 2)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (7, 4)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (7, 5)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (8, 1)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (8, 2)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (9, 2)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (9, 5)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (10, 1)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (10, 3)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (11, 4)
INSERT [dbo].[Game_Category] ([gameId], [categoryId]) VALUES (11, 5)
GO
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (1, N'Brawlhalla is a free 2D platform fighting game that supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android! History''s greatest warriors brawl to prove who''s the best in an epic test of strength and skill.', N'Brawlhalla is a free-to-play platform fighting game1234developed by Blue Mammoth Games. It was originally released for macOS, PlayStation 4 and Windows in 2017, with ports for Nintendo Switch, Xbox One, Android and iOS released later2. The game supports up to 8 local or online players with full cross-play for PC, PS5, PS4, Xbox Series X|S, Xbox One, Nintendo Switch, iOS and Android1. Players choose from a list of 50+ fighters called Legends and duke it out on various platforms (stages)')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (2, N'Dota is the undisputed granddaddy of all multiplayer online battle arena (MOBA) games, having started the genre itself as a mod for Warcraft III in the early 2000?s. The game has greatly evolved since then to become what is now Dota 2, though it remains far and away the most in-depth and complex of all the MOBAs.', N'Dota 2 is a multiplayer online battle arena (MOBA) video game by Valve1234. It is a sequel to Defense of the Ancients (DotA), a community-created mod for Blizzard Entertainment''s Warcraft III: Reign of Chaos1. In Dota 2, players team up in two sets of five, each controlling one of many Heroes to take out the enemy base23. The game was released in July 20134.')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (3, N'Tower of Fantasy is a free-to-play open world action role-playing game developed by Hotta Studio, a subsidiary of Perfect World. The game is set in the far future on the extraterrestrial planet "Aida"?', N'Tower of Fantasy is a 3D "shared world" action role-playing game1. It is an open-world game made in the style of Genshin Impact2. The game features a high degree of freedom in world exploration, a scrappy sci-fi art style, interactive puzzle elements, and fast combat feel3. The player controls a customizable character avatar who interacts with non-player characters and other entities and collects items as they travel around in the open virtual world1.')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (4, N'Random introduction for Game 4', N'Long random description for Game 4')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (5, N'Random introduction for Game 5', N'Long random description for Game 5')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (6, N'Random introduction for Game 6', N'Long random description for Game 6')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (7, N'Random introduction for Game 7', N'Long random description for Game 7')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (8, N'Random introduction for Game 8', N'Long random description for Game 8')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (9, N'Random introduction for Game 9', N'Long random description for Game 9')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (10, N'Random introduction for Game 10', N'Long random description for Game 10')
INSERT [dbo].[GameDetails] ([gameId], [introduction], [description]) VALUES (11, N'Random introduction for Game 11', N'Long random description for Game 11')
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (1, N'Brawl Halla', 36, 24, N'categories-01.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (2, N'Dota 2', 32, 22, N'categories-02.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (3, N'Tower Of Fantasy', 45, 31, N'categories-03.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (4, N'STAR WARS™: Battlefront Classic Collection', 20, 18, N'hero-capsule.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (5, N'NBA 2K24', 50, 8, N'nba-2k24.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (6, N'Slay the Spire', 15, 5, N'slay-the-spire.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (7, N'Mount & Blade II: Bannerlord', 40, 24, N'mount-blade-bannerlord.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (8, N'Sid Meier’s Civilization® VI', 35, 4, N'sid-meier-civilization.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (9, N'MARVEL SNAP', 3, 2, N'marvel-snap.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (10, N'Shadowverse CCG', 10, 5, N'shadowverse-ccg.jpg')
INSERT [dbo].[Games] ([id], [name], [listedPrice], [discountPrice], [imageURL]) VALUES (11, N'Wizard101', 3, 2, N'wizard101.jpg')
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (1, 1, 1, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (2, 1, 2, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (3, 1, 3, 2)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (4, 2, 4, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (5, 2, 5, 22)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (6, 2, 6, 31)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (7, 2, 7, 18)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (8, 2, 8, 8)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (9, 2, 9, 5)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (10, 2, 10, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (11, 2, 11, 4)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (12, 2, 12, 2)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (13, 2, 13, 5)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (14, 2, 14, 2)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (15, 3, 15, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (16, 4, 16, 2)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (17, 4, 17, 24)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (18, 5, 18, 4)
INSERT [dbo].[OrderItems] ([id], [orderId], [cartItemId], [price]) VALUES (19, 5, 19, 8)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [userId], [orderDate]) VALUES (1, 1, CAST(N'2024-03-08T00:23:39.010' AS DateTime))
INSERT [dbo].[Orders] ([id], [userId], [orderDate]) VALUES (2, 3, CAST(N'2024-03-08T00:24:33.930' AS DateTime))
INSERT [dbo].[Orders] ([id], [userId], [orderDate]) VALUES (3, 2, CAST(N'2024-03-08T00:24:58.517' AS DateTime))
INSERT [dbo].[Orders] ([id], [userId], [orderDate]) VALUES (4, 9, CAST(N'2024-02-29T02:33:04.000' AS DateTime))
INSERT [dbo].[Orders] ([id], [userId], [orderDate]) VALUES (5, 7, CAST(N'2024-01-08T02:33:36.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Roles] ([userId], [role]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (2, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (3, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (4, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (5, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (6, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (7, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (8, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (9, N'user')
INSERT [dbo].[Roles] ([userId], [role]) VALUES (10, N'user')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (1, N'Vũ Hồng Quang', N'quang@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (2, N'Nguyễn Hoàng Thái', N'thai@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (3, N'Trần Đình Quí', N'qui@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (4, N'Nguyễn Văn An', N'an@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (5, N'Nguyễn Văn Bình', N'binh@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (6, N'Nguyễn Văn Cẩn', N'can@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (7, N'Nguyễn Văn Dũng', N'dung@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (8, N'Nguyễn Văn Em', N'em@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (9, N'Nguyễn Văn Fight', N'fight@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
INSERT [dbo].[Users] ([id], [name], [email], [password]) VALUES (10, N'Nguyễn Văn Gà', N'ga@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([gameId])
REFERENCES [dbo].[Games] ([id])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([gameId])
REFERENCES [dbo].[Games] ([id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Game_Category]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Game_Category]  WITH CHECK ADD FOREIGN KEY([gameId])
REFERENCES [dbo].[Games] ([id])
GO
ALTER TABLE [dbo].[GameDetails]  WITH CHECK ADD FOREIGN KEY([gameId])
REFERENCES [dbo].[Games] ([id])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([cartItemId])
REFERENCES [dbo].[CartItems] ([id])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
USE [master]
GO
ALTER DATABASE [prjassdb] SET  READ_WRITE 
GO
