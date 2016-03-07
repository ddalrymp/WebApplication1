SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
       [Guid] [uniqueidentifier] NOT NULL,
       [Name] [nvarchar(50)] NOT NULL,
       [Created] [datetime] NOT NULL CONSTRAINT [DF_WebCart_Created]  DEFAULT (getdate()),
       [Modified] [datetime] NOT NULL CONSTRAINT [DF_WebCart_Modified]  DEFAULT (getdate()),
       [Finished] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
