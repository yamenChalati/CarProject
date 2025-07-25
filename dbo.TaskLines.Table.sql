USE [CarProject]
GO
/****** Object:  Table [dbo].[TaskLines]    Script Date: 7/25/2025 3:24:34 PM ******/
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
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
