USE [CarProject]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 7/25/2025 3:24:34 PM ******/
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
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [DateIssued]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('Unpaid') FOR [Status]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
