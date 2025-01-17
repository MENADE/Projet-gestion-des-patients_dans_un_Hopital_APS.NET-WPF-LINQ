USE [master]
GO
/****** Object:  Database [Hospital_Data]    Script Date: 2020-12-27 14:51:12 ******/
CREATE DATABASE [Hospital_Data] 
GO
USE [Hospital_Data]
GO
/****** Object:  UserDefinedFunction [dbo].[Bool_chirurgie]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[Bool_chirurgie]
(
    @date_chirurgie as date,
	@chirurgie_programmé as bit
)
RETURNS bit
AS
BEGIN
	Declare @bool bit
	
	IF (@chirurgie_programmé =0 AND  @date_chirurgie IS NOT NULL )
		begin
			SET @bool =0			
		end
	else if(@chirurgie_programmé =1 AND  @date_chirurgie IS NULL )	
	begin	 
	  SET @bool =0	
	end

	else if(@chirurgie_programmé =1 AND  @date_chirurgie IS NOT NULL )	
	begin	 
	  SET @bool =1	
	end

	return @bool	
END
GO
/****** Object:  UserDefinedFunction [dbo].[Bool_occupe_Lit]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[Bool_occupe_Lit]
(
    @date_congé as date,
	@occupé as bit
)
RETURNS bit
AS
BEGIN
	Declare @bool bit
	
	IF ((@date_congé is Null AND  @occupé =1 )or (@date_congé is not Null AND  @occupé =0))
		begin
			SET @bool =1			
		end
	else --if((@date_congé is  Null AND  @occupé =0 )	or ( @date_congé is not Null AND  @occupé =1))
	begin	 
	  SET @bool =0	
	end

return @bool	
END
GO
/****** Object:  Table [dbo].[tblAdmission]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmission](
	[IDAdmission] [int] NOT NULL,
	[chirurgie_programmé] [bit] NULL,
	[date_admission] [date] NULL,
	[date_chirurgie] [date] NULL,
	[date_congé] [date] NULL,
	[téléviseur] [bit] NULL,
	[téléphone] [bit] NULL,
	[NSS] [int] NULL,
	[Numérolit] [int] NULL,
	[IDMédecin] [int] NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[IDAdmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAssurance]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAssurance](
	[IDAssurance] [int] NOT NULL,
	[nom_compagnie] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Assurance] PRIMARY KEY CLUSTERED 
(
	[IDAssurance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDepartement]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDepartement](
	[IDDépartement] [int] NOT NULL,
	[nom_département] [varchar](30) NULL,
 CONSTRAINT [PK_Département] PRIMARY KEY CLUSTERED 
(
	[IDDépartement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLit]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLit](
	[Numérolit] [int] NOT NULL,
	[occupé] [bit] NOT NULL,
	[IDType] [int] NOT NULL,
	[IDDépartement] [int] NOT NULL,
 CONSTRAINT [PK_Lit] PRIMARY KEY CLUSTERED 
(
	[Numérolit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMedecin]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMedecin](
	[IDMédecin] [int] NOT NULL,
	[nom] [varchar](30) NULL,
	[prénom] [varchar](30) NULL,
 CONSTRAINT [PK_Médecin] PRIMARY KEY CLUSTERED 
(
	[IDMédecin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPatient]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPatient](
	[NSS] [int] NOT NULL,
	[date_naissance] [date] NULL,
	[nom] [varchar](30) NULL,
	[prénom] [varchar](30) NULL,
	[adresse] [varchar](50) NULL,
	[ville] [varchar](30) NULL,
	[province] [varchar](30) NULL,
	[code_postal] [varchar](30) NULL,
	[téléphone] [varchar](30) NULL,
	[IDAssurance] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[NSS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTypeLit]    Script Date: 2020-12-27 14:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTypeLit](
	[IDType] [int] NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_TypeLit] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (500, 1, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-02' AS Date), NULL, 1, 1, 1001, 702, 301)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5001, 1, CAST(N'2020-01-08' AS Date), CAST(N'2020-12-25' AS Date), CAST(N'2020-12-17' AS Date), 1, 0, 1001, 701, 301)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5002, 1, CAST(N'2019-11-19' AS Date), CAST(N'2020-12-29' AS Date), CAST(N'2020-12-08' AS Date), 0, 1, 1002, 702, 302)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5003, 1, CAST(N'2018-08-22' AS Date), CAST(N'2020-12-27' AS Date), NULL, 1, 0, 1003, 703, 303)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5004, 1, CAST(N'2017-07-28' AS Date), CAST(N'2020-12-26' AS Date), NULL, 1, 0, 1004, 704, 304)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5005, 1, CAST(N'2020-04-17' AS Date), CAST(N'2020-12-19' AS Date), NULL, 0, 1, 1005, 705, 305)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5006, 1, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-29' AS Date), CAST(N'2020-12-15' AS Date), 1, 1, 1001, 709, 303)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5007, 1, CAST(N'2020-12-16' AS Date), CAST(N'2020-12-20' AS Date), CAST(N'2020-12-22' AS Date), 1, 1, 1002, 708, 303)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5008, 1, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-21' AS Date), CAST(N'2020-12-08' AS Date), 1, 1, 1003, 704, 307)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5009, 1, CAST(N'2020-12-29' AS Date), CAST(N'2020-12-22' AS Date), CAST(N'2020-12-09' AS Date), 1, 0, 1004, 703, 305)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5010, 1, CAST(N'2020-12-09' AS Date), CAST(N'2020-12-13' AS Date), CAST(N'2020-12-22' AS Date), 1, 1, 1005, 701, 305)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5011, 1, CAST(N'2020-12-21' AS Date), CAST(N'2020-12-23' AS Date), NULL, 1, 1, 1006, 702, 306)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5012, 1, CAST(N'2020-12-09' AS Date), CAST(N'2020-12-15' AS Date), NULL, 1, 0, 1001, 707, 303)
INSERT [dbo].[tblAdmission] ([IDAdmission], [chirurgie_programmé], [date_admission], [date_chirurgie], [date_congé], [téléviseur], [téléphone], [NSS], [Numérolit], [IDMédecin]) VALUES (5013, 1, CAST(N'2020-12-07' AS Date), CAST(N'2020-12-08' AS Date), NULL, 1, 1, 1004, 709, 302)
INSERT [dbo].[tblAssurance] ([IDAssurance], [nom_compagnie]) VALUES (101, N'Financière SunLife')
INSERT [dbo].[tblAssurance] ([IDAssurance], [nom_compagnie]) VALUES (102, N'La Capitale')
INSERT [dbo].[tblAssurance] ([IDAssurance], [nom_compagnie]) VALUES (103, N'Alliance')
INSERT [dbo].[tblAssurance] ([IDAssurance], [nom_compagnie]) VALUES (104, N'AssuranceDirect')
INSERT [dbo].[tblAssurance] ([IDAssurance], [nom_compagnie]) VALUES (105, N'MMAF')
INSERT [dbo].[tblDepartement] ([IDDépartement], [nom_département]) VALUES (11, N'Chirurgie')
INSERT [dbo].[tblDepartement] ([IDDépartement], [nom_département]) VALUES (12, N'pédiatrie')
INSERT [dbo].[tblDepartement] ([IDDépartement], [nom_département]) VALUES (13, N'Génycologie')
INSERT [dbo].[tblDepartement] ([IDDépartement], [nom_département]) VALUES (14, N'Ophtalmologie')
INSERT [dbo].[tblDepartement] ([IDDépartement], [nom_département]) VALUES (15, N'Cardiologie')
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (701, 0, 61, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (702, 0, 62, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (703, 1, 63, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (704, 0, 61, 12)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (705, 0, 62, 12)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (706, 1, 61, 13)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (707, 1, 63, 15)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (708, 0, 62, 14)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (709, 1, 61, 12)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (710, 0, 61, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (711, 1, 63, 12)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (712, 0, 62, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (713, 0, 62, 11)
INSERT [dbo].[tblLit] ([Numérolit], [occupé], [IDType], [IDDépartement]) VALUES (714, 0, 62, 11)
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (301, N'Alian', N'Boure')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (302, N'Stepan', N'Bernard')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (303, N'Georges', N'Amed')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (304, N'Karim', N'Soufi')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (305, N'Lauzon', N'Francine')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (306, N'Nguyen', N'Jacqueline')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (307, N'Gendron', N'Rita')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (308, N'Piere', N'Domont')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (309, N'Pasteur', N'Sebastien')
INSERT [dbo].[tblMedecin] ([IDMédecin], [nom], [prénom]) VALUES (310, N'Salim', N'Derri')
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1001, CAST(N'1980-01-01' AS Date), N'Tremblay', N'Marie', N'777 Brockton Avenue', N'Abington', N'Quebec', N'H1Y 3A4', N'438-555-9147', 101)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1002, CAST(N'1979-05-07' AS Date), N'Bouchard', N'Marguerite', N'250 Hartford Avenue', N'Totonto', N'Ontario', N'N1P 4L1', N'416-748-20478', NULL)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1003, CAST(N'1968-09-25' AS Date), N'Ouellet', N'Therese', N'66-4 Parkhurst Rd', N'Chelmsford', N'Alberta', N'G1Y 7K8', N'418-201-7826', 103)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1004, CAST(N'1955-01-12' AS Date), N'Pelletier', N'Louise', N'55 Brooksby Rd', N'Danvers', N'New York', N'W1M 5O9', N'416-457-8745', 104)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1005, CAST(N'1960-11-28' AS Date), N'Lévesque', N'Lise', N'121 Worcester Rd', N'Framingham', N'California', N'T0F 8R7', N'417-542-5214', 105)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1006, CAST(N'2020-10-05' AS Date), N'Alex', N'Fergison', N'20 Albert street', N'Toronto', N'Ontrario', N'K2F 2RT', N'416-215-5214', 101)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1007, CAST(N'1988-10-10' AS Date), N'Ahmed', N'Younes', N'22 Street Mechael Rou', N'Montreal', N'Quebec', N'K5J 8E4', N'416-758-7458', 104)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1008, CAST(N'2020-12-08' AS Date), N'Fares', N'Amir', N'35 Bloor Street', N'Toront', N'Ontario', N'H5D 4H7', N'416-888-7777', 105)
INSERT [dbo].[tblPatient] ([NSS], [date_naissance], [nom], [prénom], [adresse], [ville], [province], [code_postal], [téléphone], [IDAssurance]) VALUES (1009, CAST(N'2020-12-21' AS Date), N'poll', N'Klyn', N'32 trump Street ', N'Ohio', N'Goergia', N'45 8R2', N'416-458-5214', 103)
INSERT [dbo].[tblTypeLit] ([IDType], [description]) VALUES (61, N'Chambre_Standard')
INSERT [dbo].[tblTypeLit] ([IDType], [description]) VALUES (62, N'Chambre_Semi_Privé')
INSERT [dbo].[tblTypeLit] ([IDType], [description]) VALUES (63, N'Chambre_Privé')
ALTER TABLE [dbo].[tblAdmission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Lit] FOREIGN KEY([Numérolit])
REFERENCES [dbo].[tblLit] ([Numérolit])
GO
ALTER TABLE [dbo].[tblAdmission] CHECK CONSTRAINT [FK_Admission_Lit]
GO
ALTER TABLE [dbo].[tblAdmission]  WITH NOCHECK ADD  CONSTRAINT [FK_Admission_Medecin] FOREIGN KEY([IDMédecin])
REFERENCES [dbo].[tblMedecin] ([IDMédecin])
GO
ALTER TABLE [dbo].[tblAdmission] NOCHECK CONSTRAINT [FK_Admission_Medecin]
GO
ALTER TABLE [dbo].[tblAdmission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Patient] FOREIGN KEY([NSS])
REFERENCES [dbo].[tblPatient] ([NSS])
GO
ALTER TABLE [dbo].[tblAdmission] CHECK CONSTRAINT [FK_Admission_Patient]
GO
ALTER TABLE [dbo].[tblLit]  WITH CHECK ADD  CONSTRAINT [FK_Lit_Département] FOREIGN KEY([IDDépartement])
REFERENCES [dbo].[tblDepartement] ([IDDépartement])
GO
ALTER TABLE [dbo].[tblLit] CHECK CONSTRAINT [FK_Lit_Département]
GO
ALTER TABLE [dbo].[tblLit]  WITH CHECK ADD  CONSTRAINT [FK_Lit_TypeLit] FOREIGN KEY([IDType])
REFERENCES [dbo].[tblTypeLit] ([IDType])
GO
ALTER TABLE [dbo].[tblLit] CHECK CONSTRAINT [FK_Lit_TypeLit]
GO
ALTER TABLE [dbo].[tblPatient]  WITH NOCHECK ADD  CONSTRAINT [FK_Patient_Assurance] FOREIGN KEY([IDAssurance])
REFERENCES [dbo].[tblAssurance] ([IDAssurance])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblPatient] NOCHECK CONSTRAINT [FK_Patient_Assurance]
GO
ALTER TABLE [dbo].[tblAdmission]  WITH CHECK ADD  CONSTRAINT [CK_chirurg] CHECK  (([DBO].[Bool_chirurgie]([date_chirurgie],[chirurgie_programmé])=(1)))
GO
ALTER TABLE [dbo].[tblAdmission] CHECK CONSTRAINT [CK_chirurg]
GO
USE [master]
GO
ALTER DATABASE [Hospital_Data] SET  READ_WRITE 
GO
