USE [master]
GO
/****** Object:  Database [CarProject]    Script Date: 7/25/2025 3:30:35 PM ******/
CREATE DATABASE [CarProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.YAMEN\MSSQL\DATA\CarProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.YAMEN\MSSQL\DATA\CarProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarProject] SET RECOVERY FULL 
GO
ALTER DATABASE [CarProject] SET  MULTI_USER 
GO
ALTER DATABASE [CarProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarProject', N'ON'
GO
ALTER DATABASE [CarProject] SET QUERY_STORE = OFF
GO
USE [CarProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CarProject]
GO
/****** Object:  Table [dbo].[CustomerCars]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LicensePlate] [nvarchar](20) NOT NULL,
	[PlateType] [nvarchar](20) NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[VIN] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](30) NOT NULL,
	[EngineType] [nvarchar](20) NOT NULL,
	[TransmissionType] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[WarrantyStartDate] [date] NULL,
	[WarrantyEndDate] [date] NULL,
	[WarrantyMaxMileage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[LastLogin] [datetime] NULL,
	[LastPresentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryGroupItems]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryGroupItems](
	[InventoryID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryGroups]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryGroups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceLines]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLines](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[TaskLineID] [int] NULL,
	[InventoryID] [int] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[LineTotal]  AS ([Quantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[DateIssued] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskLines]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLines](
	[TaskLineID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[InventoryID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[LineTotal]  AS ([Quantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[TaskLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/25/2025 3:30:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ReceivedAt] [datetime] NOT NULL,
	[DeliveredAt] [datetime] NULL,
	[DelayReason] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerCars] ON 

INSERT [dbo].[CustomerCars] ([CarID], [CustomerID], [LicensePlate], [PlateType], [Make], [Model], [Year], [VIN], [Color], [EngineType], [TransmissionType], [Status], [WarrantyStartDate], [WarrantyEndDate], [WarrantyMaxMileage]) VALUES (1, 1, N'34ABC123', N'Standard', N'Toyota', N'Corolla', 2020, N'VIN0001', N'Red', N'Gasoline', N'Automatic', N'Active', CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date), 100000)
INSERT [dbo].[CustomerCars] ([CarID], [CustomerID], [LicensePlate], [PlateType], [Make], [Model], [Year], [VIN], [Color], [EngineType], [TransmissionType], [Status], [WarrantyStartDate], [WarrantyEndDate], [WarrantyMaxMileage]) VALUES (2, 2, N'06XYZ456', N'Commercial', N'Ford', N'Transit', 2018, N'VIN0002', N'White', N'Diesel', N'Manual', N'Active', CAST(N'2018-06-15' AS Date), CAST(N'2023-06-15' AS Date), 200000)
INSERT [dbo].[CustomerCars] ([CarID], [CustomerID], [LicensePlate], [PlateType], [Make], [Model], [Year], [VIN], [Color], [EngineType], [TransmissionType], [Status], [WarrantyStartDate], [WarrantyEndDate], [WarrantyMaxMileage]) VALUES (3, 3, N'35LMN789', N'Government', N'Hyundai', N'Elantra', 2022, N'VIN0003', N'Black', N'Hybrid', N'CVT', N'Under Maintenance', CAST(N'2022-03-01' AS Date), CAST(N'2027-03-01' AS Date), 120000)
SET IDENTITY_INSERT [dbo].[CustomerCars] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [Phone], [Email], [Type], [Status], [CreatedAt]) VALUES (1, N'John Doe', N'123 Elm St', N'555-1111', N'john@example.com', N'Regular', N'Active', CAST(N'2025-07-25T14:57:29.330' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [Phone], [Email], [Type], [Status], [CreatedAt]) VALUES (2, N'Alice Smith', N'456 Oak Ave', N'555-2222', N'alice@example.com', N'Regular', N'Active', CAST(N'2025-07-25T14:57:29.330' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [Phone], [Email], [Type], [Status], [CreatedAt]) VALUES (3, N'Bob Johnson', N'789 Pine Rd', N'555-3333', N'bob@example.com', N'Regular', N'Active', CAST(N'2025-07-25T14:57:29.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [Name], [Email], [Phone], [Type], [Status], [HireDate], [Username], [Password], [LastLogin], [LastPresentDate]) VALUES (1, N'Jane Smith', N'jane@garage.com', N'555-4444', N'Technician', N'Active', CAST(N'2021-05-10' AS Date), N'janesmith', N'pass123', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [Name], [Email], [Phone], [Type], [Status], [HireDate], [Username], [Password], [LastLogin], [LastPresentDate]) VALUES (2, N'Mike Ross', N'mike@garage.com', N'555-5555', N'Manager', N'Active', CAST(N'2020-02-20' AS Date), N'mikeross', N'adminpass', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [Name], [Email], [Phone], [Type], [Status], [HireDate], [Username], [Password], [LastLogin], [LastPresentDate]) VALUES (3, N'Sarah Lee', N'sarah@garage.com', N'555-6666', N'Technician', N'Active', CAST(N'2023-01-15' AS Date), N'sarahlee', N'techpass', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([InventoryID], [Name], [Description], [Type], [Unit], [Price], [Status]) VALUES (1, N'Brake Pad Set', N'Front brake pads for sedans', N'Part', N'Set', CAST(250.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[Inventory] ([InventoryID], [Name], [Description], [Type], [Unit], [Price], [Status]) VALUES (2, N'Engine Oil 5W-30', N'Synthetic motor oil 5W-30', N'Fluid', N'Liter', CAST(60.00 AS Decimal(18, 2)), N'Available')
INSERT [dbo].[Inventory] ([InventoryID], [Name], [Description], [Type], [Unit], [Price], [Status]) VALUES (3, N'AC Compressor', N'AC compressor unit', N'Part', N'Piece', CAST(750.00 AS Decimal(18, 2)), N'Available')
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
INSERT [dbo].[InventoryGroupItems] ([InventoryID], [GroupID]) VALUES (1, 1)
INSERT [dbo].[InventoryGroupItems] ([InventoryID], [GroupID]) VALUES (2, 2)
INSERT [dbo].[InventoryGroupItems] ([InventoryID], [GroupID]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[InventoryGroups] ON 

INSERT [dbo].[InventoryGroups] ([GroupID], [Name], [Description]) VALUES (1, N'Brake System', N'Parts for brakes')
INSERT [dbo].[InventoryGroups] ([GroupID], [Name], [Description]) VALUES (2, N'Engine Fluids', N'Oil and lubricants')
INSERT [dbo].[InventoryGroups] ([GroupID], [Name], [Description]) VALUES (3, N'Cooling System', N'AC and radiator parts')
SET IDENTITY_INSERT [dbo].[InventoryGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceLines] ON 

INSERT [dbo].[InvoiceLines] ([LineID], [InvoiceID], [TaskLineID], [InventoryID], [Description], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, N'Brake pad installation', CAST(1.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceLines] ([LineID], [InvoiceID], [TaskLineID], [InventoryID], [Description], [Quantity], [UnitPrice]) VALUES (2, 2, 2, 2, N'Oil and filter replacement', CAST(4.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[InvoiceLines] ([LineID], [InvoiceID], [TaskLineID], [InventoryID], [Description], [Quantity], [UnitPrice]) VALUES (3, 3, 3, 3, N'AC compressor replacement', CAST(1.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[InvoiceLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceID], [DateIssued], [DueDate], [TotalAmount], [Status], [Notes], [CustomerID]) VALUES (1, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-12' AS Date), CAST(250.00 AS Decimal(18, 2)), N'Unpaid', NULL, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [DateIssued], [DueDate], [TotalAmount], [Status], [Notes], [CustomerID]) VALUES (2, CAST(N'2023-07-01' AS Date), CAST(N'2023-07-11' AS Date), CAST(240.00 AS Decimal(18, 2)), N'Unpaid', NULL, 2)
INSERT [dbo].[Invoices] ([InvoiceID], [DateIssued], [DueDate], [TotalAmount], [Status], [Notes], [CustomerID]) VALUES (3, CAST(N'2023-07-10' AS Date), CAST(N'2023-07-20' AS Date), CAST(750.00 AS Decimal(18, 2)), N'Unpaid', NULL, 3)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectID], [CustomerID], [Name], [Description], [StartDate], [EndDate], [Status]) VALUES (1, 1, N'Brake Replacement', N'Full brake system overhaul.', CAST(N'2025-07-25' AS Date), NULL, N'New')
INSERT [dbo].[Projects] ([ProjectID], [CustomerID], [Name], [Description], [StartDate], [EndDate], [Status]) VALUES (2, 2, N'Oil and Filter Change', N'Routine oil and filter service.', CAST(N'2025-07-25' AS Date), NULL, N'New')
INSERT [dbo].[Projects] ([ProjectID], [CustomerID], [Name], [Description], [StartDate], [EndDate], [Status]) VALUES (3, 3, N'AC Repair', N'Fix air conditioning system.', CAST(N'2025-07-25' AS Date), NULL, N'New')
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskLines] ON 

INSERT [dbo].[TaskLines] ([TaskLineID], [TaskID], [InventoryID], [EmployeeID], [Quantity], [Description], [UnitPrice]) VALUES (1, 1, 1, 1, CAST(1.00 AS Decimal(18, 2)), N'Installed brake pad set', CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[TaskLines] ([TaskLineID], [TaskID], [InventoryID], [EmployeeID], [Quantity], [Description], [UnitPrice]) VALUES (2, 2, 2, 2, CAST(4.00 AS Decimal(18, 2)), N'Added 4 liters of engine oil', CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[TaskLines] ([TaskLineID], [TaskID], [InventoryID], [EmployeeID], [Quantity], [Description], [UnitPrice]) VALUES (3, 3, 3, 3, CAST(1.00 AS Decimal(18, 2)), N'Replaced AC compressor', CAST(750.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TaskLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([TaskID], [ProjectID], [CustomerID], [CarID], [Name], [Description], [Status], [StartTime], [EndTime], [ReceivedAt], [DeliveredAt], [DelayReason]) VALUES (1, 1, 1, 1, N'Brake Job', N'Replace front and rear brake pads and discs.', N'Completed', CAST(N'2023-06-01T10:00:00.000' AS DateTime), CAST(N'2023-06-01T14:00:00.000' AS DateTime), CAST(N'2025-07-25T14:58:26.020' AS DateTime), CAST(N'2023-06-02T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tasks] ([TaskID], [ProjectID], [CustomerID], [CarID], [Name], [Description], [Status], [StartTime], [EndTime], [ReceivedAt], [DeliveredAt], [DelayReason]) VALUES (2, 2, 2, 2, N'Oil Change', N'Change oil and oil filter.', N'Completed', CAST(N'2023-07-01T09:00:00.000' AS DateTime), CAST(N'2023-07-01T09:30:00.000' AS DateTime), CAST(N'2025-07-25T14:58:26.020' AS DateTime), CAST(N'2023-07-01T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Tasks] ([TaskID], [ProjectID], [CustomerID], [CarID], [Name], [Description], [Status], [StartTime], [EndTime], [ReceivedAt], [DeliveredAt], [DelayReason]) VALUES (3, 3, 3, 3, N'AC Diagnosis', N'Investigate and fix AC cooling issue.', N'Pending', NULL, NULL, CAST(N'2025-07-25T14:58:26.020' AS DateTime), NULL, N'Awaiting parts')
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__C5DF234CFC9C75E0]    Script Date: 7/25/2025 3:30:35 PM ******/
ALTER TABLE [dbo].[CustomerCars] ADD UNIQUE NONCLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerCars_CustomerID]    Script Date: 7/25/2025 3:30:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerCars_CustomerID] ON [dbo].[CustomerCars]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__536C85E48311A004]    Script Date: 7/25/2025 3:30:35 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoiceLines_InvoiceID]    Script Date: 7/25/2025 3:30:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_InvoiceLines_InvoiceID] ON [dbo].[InvoiceLines]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_CarID]    Script Date: 7/25/2025 3:30:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_CarID] ON [dbo].[Tasks]
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_ProjectID]    Script Date: 7/25/2025 3:30:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_ProjectID] ON [dbo].[Tasks]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerCars] ADD  DEFAULT ('Standard') FOR [PlateType]
GO
ALTER TABLE [dbo].[CustomerCars] ADD  DEFAULT ('Black') FOR [Color]
GO
ALTER TABLE [dbo].[CustomerCars] ADD  DEFAULT ('Gasoline') FOR [EngineType]
GO
ALTER TABLE [dbo].[CustomerCars] ADD  DEFAULT ('Automatic') FOR [TransmissionType]
GO
ALTER TABLE [dbo].[CustomerCars] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('Regular') FOR [Type]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT ('Available') FOR [Status]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [DateIssued]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('Unpaid') FOR [Status]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT ('New') FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  DEFAULT (getdate()) FOR [ReceivedAt]
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[InventoryGroupItems]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[InventoryGroups] ([GroupID])
GO
ALTER TABLE [dbo].[InventoryGroupItems]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([TaskLineID])
REFERENCES [dbo].[TaskLines] ([TaskLineID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[CustomerCars] ([CarID])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD CHECK  (([EngineType]='Other' OR [EngineType]='Electric' OR [EngineType]='Hybrid' OR [EngineType]='Diesel' OR [EngineType]='Gasoline'))
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD CHECK  (([PlateType]='Temporary' OR [PlateType]='Diplomatic' OR [PlateType]='Government' OR [PlateType]='Commercial' OR [PlateType]='Standard'))
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD CHECK  (([Status]='Totaled' OR [Status]='Under Maintenance' OR [Status]='Sold' OR [Status]='Inactive' OR [Status]='Active'))
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD CHECK  (([TransmissionType]='Semi-Automatic' OR [TransmissionType]='CVT' OR [TransmissionType]='Manual' OR [TransmissionType]='Automatic'))
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD  CONSTRAINT [CK_Warranty_Dates] CHECK  (([WarrantyEndDate] IS NULL OR [WarrantyStartDate] IS NULL OR [WarrantyEndDate]>=[WarrantyStartDate]))
GO
ALTER TABLE [dbo].[CustomerCars] CHECK CONSTRAINT [CK_Warranty_Dates]
GO
USE [master]
GO
ALTER DATABASE [CarProject] SET  READ_WRITE 
GO
