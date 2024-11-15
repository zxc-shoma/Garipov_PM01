USE [master]
GO
/****** Object:  Database [Polyclinic]    Script Date: 09.11.2024 17:13:08 ******/
CREATE DATABASE [Polyclinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Polyclinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Polyclinic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Polyclinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Polyclinic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Polyclinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Polyclinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Polyclinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Polyclinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Polyclinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Polyclinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Polyclinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Polyclinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Polyclinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Polyclinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Polyclinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Polyclinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Polyclinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Polyclinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Polyclinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Polyclinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Polyclinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Polyclinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Polyclinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Polyclinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Polyclinic] SET  MULTI_USER 
GO
ALTER DATABASE [Polyclinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Polyclinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Polyclinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Polyclinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Polyclinic] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Polyclinic]
GO
/****** Object:  User [reception_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE USER [reception_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[reception_user]
GO
/****** Object:  User [doctor_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE USER [doctor_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[doctor_user]
GO
/****** Object:  User [dba_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE USER [dba_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dba_user]
GO
/****** Object:  DatabaseRole [reception]    Script Date: 09.11.2024 17:13:08 ******/
CREATE ROLE [reception]
GO
/****** Object:  DatabaseRole [doctor]    Script Date: 09.11.2024 17:13:08 ******/
CREATE ROLE [doctor]
GO
/****** Object:  DatabaseRole [dba]    Script Date: 09.11.2024 17:13:08 ******/
CREATE ROLE [dba]
GO
ALTER ROLE [reception] ADD MEMBER [reception_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [reception_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [reception_user]
GO
ALTER ROLE [doctor] ADD MEMBER [doctor_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [doctor_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [doctor_user]
GO
ALTER ROLE [dba] ADD MEMBER [dba_user]
GO
ALTER ROLE [db_owner] ADD MEMBER [dba_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [reception]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [reception]
GO
ALTER ROLE [db_datareader] ADD MEMBER [doctor]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [doctor]
GO
ALTER ROLE [db_owner] ADD MEMBER [dba]
GO
/****** Object:  Schema [dba]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [dba]
GO
/****** Object:  Schema [dba_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [dba_user]
GO
/****** Object:  Schema [doctor]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [doctor]
GO
/****** Object:  Schema [doctor_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [doctor_user]
GO
/****** Object:  Schema [reception]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [reception]
GO
/****** Object:  Schema [reception_user]    Script Date: 09.11.2024 17:13:08 ******/
CREATE SCHEMA [reception_user]
GO
/****** Object:  Table [dbo].[DEPARTAMENT]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENT](
	[DEPARTAMENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEPARTAMENT_NAME] [nvarchar](max) NOT NULL,
	[DEPARTAMENT_FLOOR] [nvarchar](max) NOT NULL,
	[DEPARTAMENT_MANAGER] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DEPARTAMENT] PRIMARY KEY CLUSTERED 
(
	[DEPARTAMENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIAGNOSIS]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIAGNOSIS](
	[DIAGNOSIS_ID] [int] IDENTITY(1,1) NOT NULL,
	[DIAGNOSIS_NAME] [nvarchar](max) NOT NULL,
	[DIAGNOSIS_SIGNS] [nvarchar](max) NOT NULL,
	[DIAGNOSIS_PERIOD] [nvarchar](max) NULL,
	[DIAGNOSIS_PURPOSE] [nvarchar](max) NULL,
 CONSTRAINT [PK_DIAGNOSIS] PRIMARY KEY CLUSTERED 
(
	[DIAGNOSIS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTORS]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTORS](
	[DOCTOR_ID] [int] IDENTITY(1,1) NOT NULL,
	[DOCTOR_NAME] [nvarchar](max) NOT NULL,
	[DOCTOR_SURNAME] [nvarchar](max) NOT NULL,
	[DOCTOR_PATRONYMIC] [nvarchar](max) NOT NULL,
	[DOCTOR_POST] [nvarchar](max) NOT NULL,
	[DOCTOR_SCIENTIFIC] [nvarchar](max) NOT NULL,
	[DOCTOR_EXPERIENCE] [date] NOT NULL,
	[DOCTOR_ADRESS] [nvarchar](max) NULL,
	[DOCTOR_DEPARTAMENT_ID] [int] NOT NULL,
	[DOCTOR_WORK]  AS ((datepart(year,getdate())-datepart(year,[DOCTOR_EXPERIENCE]))-case when datepart(month,[DOCTOR_EXPERIENCE])>datepart(month,getdate()) then (1) when datepart(month,[DOCTOR_EXPERIENCE])=datepart(month,getdate()) AND datepart(day,[DOCTOR_EXPERIENCE])>datepart(day,getdate()) then (1) else (0) end),
	[DOCTOR_PHOTO] [nvarchar](100) NULL,
 CONSTRAINT [PK_DOCTORS] PRIMARY KEY CLUSTERED 
(
	[DOCTOR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICAL_HISTORY]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICAL_HISTORY](
	[HISTORY_ID] [int] IDENTITY(1,1) NOT NULL,
	[HISTORY_DOCTOR_ID] [int] NOT NULL,
	[HISTORY_PATIENT_ID] [int] NOT NULL,
	[HISTORY_DIAGNOSIS_ID] [int] NOT NULL,
	[HISTORY_TREATMENT] [nvarchar](max) NULL,
	[HISTORY_DATE_OFF_ILLNESS] [date] NOT NULL,
	[HISTORY_DATE_OFF_RECOVERY] [date] NULL,
	[HISTORY_TYPE_OFF_TREARMENT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MEDICAL HISTORY] PRIMARY KEY CLUSTERED 
(
	[HISTORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENTS]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENTS](
	[PATIENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PATIENT_NAME] [nvarchar](max) NOT NULL,
	[PATIENT_SURNAME] [nvarchar](max) NOT NULL,
	[PATIENT_PATRONYMIC] [nvarchar](max) NOT NULL,
	[PATIENT_ADRESS] [nvarchar](max) NULL,
	[PATIENT_CITY] [nvarchar](max) NOT NULL,
	[PATIENT_BIRTHDATE] [date] NOT NULL,
	[PATIENT_GENDER] [nvarchar](50) NOT NULL,
	[PATIENT_AGE]  AS ((datepart(year,getdate())-datepart(year,[PATIENT_BIRTHDATE]))-case when datepart(month,[PATIENT_BIRTHDATE])>datepart(month,getdate()) then (1) when datepart(month,[PATIENT_BIRTHDATE])=datepart(month,getdate()) AND datepart(day,[PATIENT_BIRTHDATE])>datepart(day,getdate()) then (1) else (0) end),
 CONSTRAINT [PK_PATIENTS] PRIMARY KEY CLUSTERED 
(
	[PATIENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Представление 1 графическое]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Представление 1 графическое]
AS
SELECT PATIENT_ID AS Идентификатор, PATIENT_NAME AS Имя, PATIENT_SURNAME AS Фамилия, PATIENT_PATRONYMIC AS Отчество, PATIENT_ADRESS AS Адрес, PATIENT_CITY AS Город, 
                  PATIENT_BIRTHDATE AS [Дата рождения], PATIENT_GENDER AS Пол, PATIENT_AGE AS Возраст
FROM     dbo.PATIENTS
WHERE  (PATIENT_CITY IN (N'Уфа'))
GO
/****** Object:  View [dbo].[Представление 2 графическое]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Представление 2 графическое]
AS
SELECT PATIENT_ID AS Идентификатор, PATIENT_NAME AS Имя, PATIENT_SURNAME AS Фамилия, PATIENT_PATRONYMIC AS Отчество, PATIENT_ADRESS AS Адресс, PATIENT_CITY AS Город, 
                  PATIENT_BIRTHDATE AS [Дата рождения], PATIENT_GENDER AS Пол, PATIENT_AGE AS Возраст
FROM     dbo.PATIENTS
WHERE  (PATIENT_AGE > 6 AND PATIENT_AGE < 18)
GO
/****** Object:  View [dbo].[Третье представлениe]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Третье представлениe]
AS
SELECT COUNT(DOCTOR_ID) AS [Количество врачей]
FROM     dbo.DOCTORS
GO
/****** Object:  View [dbo].[Четвертое представление]    Script Date: 09.11.2024 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Четвертое представление]
AS
SELECT SUM(DOCTOR_WORK) AS [Общий Стаж Врачей]
FROM     dbo.DOCTORS
GO
SET IDENTITY_INSERT [dbo].[DEPARTAMENT] ON 

INSERT [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID], [DEPARTAMENT_NAME], [DEPARTAMENT_FLOOR], [DEPARTAMENT_MANAGER]) VALUES (2, N'Педиатрия', N'Первый этаж', N'Уршеев Никита Юрьевич')
INSERT [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID], [DEPARTAMENT_NAME], [DEPARTAMENT_FLOOR], [DEPARTAMENT_MANAGER]) VALUES (3, N'Стоматология', N'Второй этаж', N'Каепкулов Ильназ Иршатович')
INSERT [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID], [DEPARTAMENT_NAME], [DEPARTAMENT_FLOOR], [DEPARTAMENT_MANAGER]) VALUES (4, N'Терапия', N'Третий этаж', N'Иванов Тимур Вадимович')
INSERT [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID], [DEPARTAMENT_NAME], [DEPARTAMENT_FLOOR], [DEPARTAMENT_MANAGER]) VALUES (5, N'Хирургия', N'Четвертый этаж', N'Гарипов Шамиль Рамильевич')
INSERT [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID], [DEPARTAMENT_NAME], [DEPARTAMENT_FLOOR], [DEPARTAMENT_MANAGER]) VALUES (6, N'Неврология', N'Пятый этаж', N'Бикбулатов Тимур Шамилевич')
SET IDENTITY_INSERT [dbo].[DEPARTAMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[DIAGNOSIS] ON 

INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (1, N'Гипертония', N'Повышенное артериальное давление, головная боль, усталость', N'Хроническое заболевание, требует постоянный контроль', N'Антигипертензивные препараты')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (2, N'Бронхит', N'Кашель, отдышка, слабость', N'2-3 недели', N'Антибиотики, отхаркивающие лекарства')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (3, N'Гастрит', N'Боль в животе, тошнота, рвота', N'2-4 недели', N'Противоязвенные препараты, диета')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (4, N'Диабет', N'Постоянная жажда, быстрая утомляемость', N'Хроническое заболевание, требует постоянный контроль', N'Инсулин')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (5, N'Аппендецит', N'Острая боль в правом нижнем квадрате, тошнота, рвота', N'1-2 недели после операции', N'Хирургическое вмешательство')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (6, N'Переломы', N'Боль, отек, деформация конечности', N'1-3 месяцев', N'Иммобилизация, возможно хирургическое вмешательство')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (7, N'Ожоги', N'Краснота, болезненость, пузыри на коже', N'От нескольких недель до нескольких месяцев', N'Противоспалительные и заживляющие препараты')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (8, N'ОРВИ', N'Насморк, кашель, повышенная температура', N'1-2 недели', N'Отдых, при необходимости антибиотики')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (9, N'Отит', N'Боль в ухе, лихорадка', N'1-2 недели', N'Антибиотики, обезболивающие')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (10, N'Фарингит', N'Боль в горле, температура, слабость', N'1 неделя', N'Антибиотики')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (11, N'Кариес', N'Болезненость при приеме пищи', N'1-2 визита', N'Пломбирование')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (12, N'Пульпит', N'Острая боль, повышенная чувствительность зуба', N'Несколько визитов', N'Лечение каналов')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (13, N'Стоматит', N'Язвы в ротовой полости', N'1-2 недели', N'Антисептики, обезболивающие')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (14, N'Мигрень', N'Сильная головная боль, светобоязнь', N'Хроническое заболевание', N'Противомигренозные препараты')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (15, N'Ишемический инсульт', N'Слабость в половине тела, нарушение речи', N'Длительное восстановление', N'Поддерживающая терапия, физиотерапия')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (16, N'Паркинсонизм', N'Тремор, жесткость мышц, замедленные движения', N'Хроническое забоолевание', N'Препараты для улучшения работы нервной системы')
INSERT [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID], [DIAGNOSIS_NAME], [DIAGNOSIS_SIGNS], [DIAGNOSIS_PERIOD], [DIAGNOSIS_PURPOSE]) VALUES (17, N'Рассеянный склероз', N'Нарушение координации, слабость, онемение', N'Хроническое заболевание', N'Препараты для улучшения работы нервной системы.')
SET IDENTITY_INSERT [dbo].[DIAGNOSIS] OFF
GO
SET IDENTITY_INSERT [dbo].[DOCTORS] ON 

INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (4, N'Ильназ', N'Каепкулов', N'Иршатович', N'врач-стоматолог', N'доктор медицинских наук', CAST(N'2000-02-01' AS Date), N'ул. Ленина, 1', 4, N'image/ilnaz.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (5, N'Петр', N'Иванов', N'Тимурович', N'хирург', N'высшее образование', CAST(N'2011-03-01' AS Date), N'ул. Советская, 23', 5, N'image/petr.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (7, N'Никита', N'Уршеев', N'Юрьевич', N'врач-педиатр', N'кандидат медицинский наук', CAST(N'2004-12-07' AS Date), N'ул. Зорге, 33', 2, N'image/nikita.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (8, N'Михаил', N'Ахметов', N'Ибрагимович', N'врач-невролог', N'высшее образование', CAST(N'2016-11-02' AS Date), N'ул. 8 марта, 44', 6, N'image/misha.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (9, N'Тимур', N'Иванов', N'Вадимович', N'врач-терапевт', N'доктор медицинских наук', CAST(N'1999-03-10' AS Date), N'ул. Ленина 61', 4, N'image/timur.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (10, N'Милена', N'Хуснуллина', N'Рустэмовна', N'врач-педиатр', N'высшее образование', CAST(N'2018-03-20' AS Date), N'ул. Школьная 22', 2, N'image/milena.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (11, N'Шамиль', N'Гарипов', N'Рамильевич', N'хирург-травматолог', N'доктор медицинских наук', CAST(N'2007-03-10' AS Date), N'ул. Больничнаяя 12', 5, N'image/shamil.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (12, N'Ксения', N'Кириллова', N'Владиславовна', N'врач-невролог', N'высшее образование', CAST(N'2020-07-11' AS Date), N'ул. Коммунистичекая 212', 6, NULL)
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (13, N'Марат', N'Суворов', N'Кириллович', N'медбрат', N'среднее образование', CAST(N'2021-02-20' AS Date), N'ул. Гоголя 22', 2, N'image/daniil.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (14, N'Алёна', N'Белякова', N'Руслановна', N'медсестра', N'среднее образование', CAST(N'2020-08-11' AS Date), N'ул. Победы 24', 3, N'image/alena.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (15, N'Павел', N'Сергеев', N'Максимович', N'хирург', N'высшее образование', CAST(N'2018-03-31' AS Date), N'ул. Галле 3', 5, N'image/pavel.jpeg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (16, N'Тимур', N'Бикбулатов', N'Шамилевич', N'врач-невролог', N'кандидат медицинских наук', CAST(N'2005-10-19' AS Date), N'ул. Дзержинского 108', 6, N'image/timurbig.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (17, N'Дарья', N'Козлова', N'Матвеевна', N'медсестра', N'среднее образование', CAST(N'2018-10-10' AS Date), N'ул. Красногорская 120', 4, N'image/dasha.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (18, N'Татьяна', N'Соколова', N'Ярославовна', N'старшая медсестра', N'высшее образование', CAST(N'1997-12-10' AS Date), N'ул. Революционная 203', 4, N'image/tanya.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (19, N'Артем', N'Глебович', N'Васильевич', N'врач-терапевт', N'высшее образование', CAST(N'2009-03-29' AS Date), N'ул. Мира 33', 4, NULL)
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (20, N'Владислав', N'Калинин', N'Михайлович', N'детский стоматолог', N'высшее образование', CAST(N'2013-10-10' AS Date), N'ул. Парковая 3', 3, N'image/vlad.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (21, N'Марк', N'Самсонов', N'Константинович', N'стоматолог-ортопед', N'высшее образование', CAST(N'2010-02-10' AS Date), N'ул. Карпова 9', 3, N'image/mark.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (23, N'Семен', N'Лобанов', N'Петрович', N'врач-невролог', N'высшее образование', CAST(N'2018-04-19' AS Date), N'ул. Белорусская 29', 6, N'image/fedor.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (24, N'Кирилл', N'Левин', N'Яковлевич', N'участковый педиатр', N'доктор медицинских наук', CAST(N'2017-08-10' AS Date), N'ул. Седова 29', 2, N'image/kirill.jpg')
INSERT [dbo].[DOCTORS] ([DOCTOR_ID], [DOCTOR_NAME], [DOCTOR_SURNAME], [DOCTOR_PATRONYMIC], [DOCTOR_POST], [DOCTOR_SCIENTIFIC], [DOCTOR_EXPERIENCE], [DOCTOR_ADRESS], [DOCTOR_DEPARTAMENT_ID], [DOCTOR_PHOTO]) VALUES (26, N'Анна', N'Гаврилова', N'Максимовна', N'медсестра', N'среднее образование', CAST(N'2016-10-10' AS Date), N'ул. Парковая 12', 5, N'image/anna.jpg')
SET IDENTITY_INSERT [dbo].[DOCTORS] OFF
GO
SET IDENTITY_INSERT [dbo].[MEDICAL_HISTORY] ON 

INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (2, 4, 28, 11, N'Второй визит через неделю', CAST(N'2024-03-26' AS Date), NULL, N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (4, 15, 22, 7, N'Постельный режим 2 недели', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-14' AS Date), N'Станционарное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (5, 24, 13, 8, N'Обильное питье', CAST(N'2024-03-08' AS Date), CAST(N'2024-03-15' AS Date), N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (7, 9, 8, 10, N'Постельный режим', CAST(N'2024-02-03' AS Date), CAST(N'2024-02-21' AS Date), N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (9, 16, 29, 14, NULL, CAST(N'2024-03-27' AS Date), NULL, N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (10, 7, 26, 9, NULL, CAST(N'2024-01-29' AS Date), CAST(N'2024-02-07' AS Date), N'Станционарное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (11, 11, 14, 6, N'Гипс на 3 недели', CAST(N'2024-03-26' AS Date), NULL, N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (13, 20, 5, 11, NULL, CAST(N'2024-02-19' AS Date), CAST(N'2024-02-19' AS Date), N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (15, 24, 13, 8, NULL, CAST(N'2023-10-29' AS Date), CAST(N'2023-11-09' AS Date), N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (16, 21, 10, 12, N'Второй визит через 10 дней', CAST(N'2024-03-17' AS Date), NULL, N'Амбулаторное')
INSERT [dbo].[MEDICAL_HISTORY] ([HISTORY_ID], [HISTORY_DOCTOR_ID], [HISTORY_PATIENT_ID], [HISTORY_DIAGNOSIS_ID], [HISTORY_TREATMENT], [HISTORY_DATE_OFF_ILLNESS], [HISTORY_DATE_OFF_RECOVERY], [HISTORY_TYPE_OFF_TREARMENT]) VALUES (17, 21, 10, 12, NULL, CAST(N'2024-03-17' AS Date), CAST(N'2024-03-27' AS Date), N'Амбулаторное')
SET IDENTITY_INSERT [dbo].[MEDICAL_HISTORY] OFF
GO
SET IDENTITY_INSERT [dbo].[PATIENTS] ON 

INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (3, N'Ольга', N'Синдеева', N'Алексеевна', N'Ленинская 7 ', N'Уфа', CAST(N'1985-07-01' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (4, N'Милана', N'Ульяшина', N'Леонидовна', N'Сельская 5', N'Уфа', CAST(N'1982-12-24' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (5, N'Данил', N'Дуров', N'Григорьевич', N'Колхозная 14', N'Алексеевка', CAST(N'2016-07-16' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (7, N'Татьяна', N'Уксюзова', N'Саввановна', N'Заречный пер.', N'Уфа', CAST(N'1969-08-07' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (8, N'Маргарита', N'Дасаева', N'Прокловна', N'Солнечная 6', N'Уфа', CAST(N'1999-01-23' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (9, N'Давид', N'Пушкин', N'Венедектович', N'Юбилейная 16', N'Иглино', CAST(N'2009-01-27' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (10, N'Анжела', N'Стеблева', N'Ипполитовна', N'Вокзальная 1', N'Уфа', CAST(N'1970-09-01' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (11, N'Наталья', N'Черных', N'Григорьевна', N'Пионерская 19', N'Зубово', CAST(N'1990-04-04' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (13, N'Ефим', N'Новомейский', N'Всеволодович', N'Мичурина 19', N'Уфа', CAST(N'2018-12-04' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (14, N'Иван', N'Ермилов', N'Викторович', N'Первомайская 14', N'Уфа', CAST(N'1989-07-22' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (16, N'Роман', N'Пожарский', N'Иннокентиевич', N'Октябрьская 123', N'Зубово', CAST(N'1992-12-25' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (19, N'Севастьян', N'Лоскутов', N'Юлианович', N'Западная 3', N'Уфа', CAST(N'2013-02-28' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (22, N'Денис', N'Старков', N'Львович', N'Речная 12', N'Уфа', CAST(N'1961-02-25' AS Date), N'Муж')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (26, N'Тамара', N'Тимашева', N'Константинова', N'Дружная 22', N'Нагаево', CAST(N'2008-03-24' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (28, N'Ася', N'Терехова', N'Алексеевна', N'ЯнкиКупалы 20', N'Уфа', CAST(N'1993-03-26' AS Date), N'Жен')
INSERT [dbo].[PATIENTS] ([PATIENT_ID], [PATIENT_NAME], [PATIENT_SURNAME], [PATIENT_PATRONYMIC], [PATIENT_ADRESS], [PATIENT_CITY], [PATIENT_BIRTHDATE], [PATIENT_GENDER]) VALUES (29, N'Евгения', N'Менде', N'Ефимовна', N'Чапаева 120', N'Уфа', CAST(N'1997-06-10' AS Date), N'Жен')
SET IDENTITY_INSERT [dbo].[PATIENTS] OFF
GO
ALTER TABLE [dbo].[DOCTORS]  WITH CHECK ADD  CONSTRAINT [FK_DOCTORS_DEPARTAMENT] FOREIGN KEY([DOCTOR_DEPARTAMENT_ID])
REFERENCES [dbo].[DEPARTAMENT] ([DEPARTAMENT_ID])
GO
ALTER TABLE [dbo].[DOCTORS] CHECK CONSTRAINT [FK_DOCTORS_DEPARTAMENT]
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_MEDICAL HISTORY_DIAGNOSIS] FOREIGN KEY([HISTORY_DIAGNOSIS_ID])
REFERENCES [dbo].[DIAGNOSIS] ([DIAGNOSIS_ID])
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY] CHECK CONSTRAINT [FK_MEDICAL HISTORY_DIAGNOSIS]
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_MEDICAL HISTORY_DOCTORS] FOREIGN KEY([HISTORY_DOCTOR_ID])
REFERENCES [dbo].[DOCTORS] ([DOCTOR_ID])
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY] CHECK CONSTRAINT [FK_MEDICAL HISTORY_DOCTORS]
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_MEDICAL HISTORY_PATIENTS] FOREIGN KEY([HISTORY_PATIENT_ID])
REFERENCES [dbo].[PATIENTS] ([PATIENT_ID])
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY] CHECK CONSTRAINT [FK_MEDICAL HISTORY_PATIENTS]
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY]  WITH CHECK ADD  CONSTRAINT [CK_MEDICAL_HISTORY] CHECK  (([HISTORY_TYPE_OFF_TREARMENT] like 'Амбулаторное' OR [HISTORY_TYPE_OFF_TREARMENT] like 'Станционарное'))
GO
ALTER TABLE [dbo].[MEDICAL_HISTORY] CHECK CONSTRAINT [CK_MEDICAL_HISTORY]
GO
ALTER TABLE [dbo].[PATIENTS]  WITH CHECK ADD  CONSTRAINT [CHK_Gender] CHECK  (([PATIENT_GENDER]='Жен' OR [PATIENT_GENDER]='Муж'))
GO
ALTER TABLE [dbo].[PATIENTS] CHECK CONSTRAINT [CHK_Gender]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[41] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PATIENTS"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 227
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3180
         Table = 1170
         Output = 624
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 84
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление 1 графическое'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление 1 графическое'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[40] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PATIENTS"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 297
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2436
         Alias = 1512
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1428
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление 2 графическое'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Представление 2 графическое'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DOCTORS"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 4320
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Третье представлениe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Третье представлениe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[1] 2[39] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DOCTORS"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 6936
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Четвертое представление'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Четвертое представление'
GO
USE [master]
GO
ALTER DATABASE [Polyclinic] SET  READ_WRITE 
GO
