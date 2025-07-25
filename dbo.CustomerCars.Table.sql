USE [CarProject]
GO
/****** Object:  Table [dbo].[CustomerCars]    Script Date: 7/25/2025 3:24:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerCars_CustomerID]    Script Date: 7/25/2025 3:24:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerCars_CustomerID] ON [dbo].[CustomerCars]
(
	[CustomerID] ASC
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
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
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
