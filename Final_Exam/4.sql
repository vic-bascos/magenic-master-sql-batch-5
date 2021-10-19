CREATE TABLE [dbo].[Ranking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_Ranking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[Ranking] ON

MERGE INTO [dbo].[Ranking] AS Target
USING (VALUES
(1, N'Inactive'),
(2, N' Bronze'),
(3, N' Silver'),
(4, N' Gold'),
(5, N' Platinum')) 
AS Source ([Id],[Description])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Description], Target.[Description]) IS NOT NULL) THEN
 UPDATE SET
  [Description] = Source.[Description]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id], [Description])
 VALUES(SOURCE.[Id], SOURCE.[Description])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;

SET IDENTITY_INSERT [dbo].[Ranking] OFF

ALTER TABLE Customer
ADD RankId INT,
FOREIGN KEY (RankId) REFERENCES Ranking(Id);