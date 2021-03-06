USE [wavvesso_GPO]
GO
/****** Object:  User [prasadthalla]    Script Date: 10/28/2017 7:24:40 AM ******/
CREATE USER [prasadthalla] FOR LOGIN [prasadthalla] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [prasadthalla]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [prasadthalla]
GO
ALTER ROLE [db_datareader] ADD MEMBER [prasadthalla]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [prasadthalla]
GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE](
	[COURSE_ID] [int] IDENTITY(1,1) NOT NULL,
	[COURSE_NAME] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[COURSE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COURSE_LINK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COURSE_LINK](
	[COURSE_LINK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FEEDBACK_GPO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FEEDBACK_GPO](
	[NAME] [varchar](100) NULL,
	[E_MAIL] [varchar](100) NULL,
	[MOBILE] [varchar](20) NULL,
	[MESSGE] [varchar](7500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_INFO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_INFO](
	[FILEINFO_ID] [int] IDENTITY(1,1) NOT NULL,
	[STATE_ID] [int] NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[YEAR] [int] NOT NULL,
	[SEMISTER_ID] [int] NOT NULL,
	[SUBJECT_ID] [int] NOT NULL,
	[PAPER_ID] [int] NOT NULL,
	[FILE_PATH] [varchar](200) NULL,
	[DESCRIPTION] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MENU](
	[MENU_ID] [int] IDENTITY(1,1) NOT NULL,
	[MENU_CD] [varchar](200) NULL,
	[TITLE] [varchar](200) NULL,
	[DESCRIPTION] [varchar](200) NULL,
 CONSTRAINT [PK_MENU_ID] PRIMARY KEY CLUSTERED 
(
	[MENU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENU_ITEM_XREF]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU_ITEM_XREF](
	[MENU_ITEM_XREF_ID] [int] IDENTITY(1,1) NOT NULL,
	[MENU_ID] [int] NULL,
	[MENU_SECTION_ID] [int] NULL,
	[ROLE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MENU_ITEM_XREF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MENU_SECTION]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MENU_SECTION](
	[MENU_SECTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](200) NULL,
	[MENU_SECTION_DESCRIPTION] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MENU_SECTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAPER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAPER](
	[PAPER_ID] [int] IDENTITY(1,1) NOT NULL,
	[PAPER_NAME] [varchar](200) NOT NULL,
 CONSTRAINT [PK_PAPER] PRIMARY KEY CLUSTERED 
(
	[PAPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAPER_LINK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAPER_LINK](
	[SUBJECT_LINK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[SEMISTER_ID] [int] NOT NULL,
	[SUBJECT_ID] [int] NOT NULL,
	[PAPER_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UNIVERSITY_ID] ASC,
	[COURSE_ID] ASC,
	[SEMISTER_ID] ASC,
	[SUBJECT_ID] ASC,
	[PAPER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROLE](
	[ROLE_ID] [int] IDENTITY(1,1) NOT NULL,
	[ROLE_NAME] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEMISTER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEMISTER](
	[SEMISTER_ID] [int] IDENTITY(1,1) NOT NULL,
	[SEMISTER_NAME] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SEMISTER] PRIMARY KEY CLUSTERED 
(
	[SEMISTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEMISTER_LINK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEMISTER_LINK](
	[SEMISTER_LINK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[SEMISTER_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UNIVERSITY_ID] ASC,
	[COURSE_ID] ASC,
	[SEMISTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STATE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STATE](
	[STATE_ID] [int] IDENTITY(1,1) NOT NULL,
	[STATE_NAME] [varchar](200) NOT NULL,
 CONSTRAINT [PK_STATE] PRIMARY KEY CLUSTERED 
(
	[STATE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBJECT]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUBJECT](
	[SUBJECT_ID] [int] IDENTITY(1,1) NOT NULL,
	[SUBJECT_NAME] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBJECT_LINK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBJECT_LINK](
	[SUBJECT_LINK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[COURSE_ID] [int] NOT NULL,
	[SEMISTER_ID] [int] NOT NULL,
	[SUBJECT_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UNIVERSITY_ID] ASC,
	[COURSE_ID] ASC,
	[SEMISTER_ID] ASC,
	[SUBJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_MENU_GPO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MENU_GPO](
	[MENU_ID] [varchar](10) NOT NULL,
	[MENU_NAME] [varchar](200) NULL,
	[MENU_LEVEL] [varchar](5) NULL,
	[MENU_ORDER] [varchar](5) NULL,
	[PARENT_MENU_ID] [varchar](10) NULL,
 CONSTRAINT [PK_MENU_OPERA_ID] PRIMARY KEY CLUSTERED 
(
	[MENU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_REF_SCREEN_PROFILE_GPO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_REF_SCREEN_PROFILE_GPO](
	[SCREEN_ID] [varchar](10) NOT NULL,
	[PROFILE_ID] [varchar](10) NOT NULL,
	[ACCESS_TYPE] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[SCREEN_ID] ASC,
	[PROFILE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SCREEN_GPO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SCREEN_GPO](
	[SCREEN_ID] [varchar](10) NOT NULL,
	[SCREEN_MNEMONIC] [varchar](20) NULL,
	[SCREEN_NAME] [varchar](200) NULL,
	[MENU_ID] [varchar](10) NULL,
 CONSTRAINT [PK_SCREEN_ID] PRIMARY KEY CLUSTERED 
(
	[SCREEN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_USER_GPO]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_USER_GPO](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [varchar](25) NULL,
	[LAST_NAME] [varchar](25) NULL,
	[LOGIN_USER_ID] [varchar](50) NULL,
	[PASSWORD] [varchar](25) NOT NULL,
	[PSWD_CHANGED_DATE] [smalldatetime] NULL,
	[PSWD_CHANGED_COUNT] [bigint] NOT NULL CONSTRAINT [DF_T_USER_OPERA_PSWD_CHANGED_COUNT]  DEFAULT ((0)),
	[LOGIN_STATUS] [varchar](1) NULL,
	[LOCK_FLAG] [varchar](1) NULL CONSTRAINT [DF_T_USER_GPO_LOCK_FLAG]  DEFAULT ('N'),
	[PROFILE_ID] [varchar](10) NULL,
	[E_MAIL] [varchar](50) NULL,
	[COMMENTS] [varchar](500) NULL,
	[DELETE_FLAG] [varchar](1) NULL CONSTRAINT [DF_T_User_GPO_DELETE_FLAG]  DEFAULT ('N'),
	[LOGIN_DATE] [smalldatetime] NULL,
	[LOGOUT_DATE] [smalldatetime] NULL,
	[CREATED_BY] [varchar](10) NULL,
	[CREATED_DATE] [smalldatetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UNIVERSITY]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UNIVERSITY](
	[UNIVERSITY_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_NAME] [varchar](200) NULL,
	[STATE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UNIVERSITY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UNIVERSITY_LINK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIVERSITY_LINK](
	[UNIVERSITY_LINK_ID] [int] IDENTITY(1,1) NOT NULL,
	[UNIVERSITY_ID] [int] NOT NULL,
	[STATE_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_TABLE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER_TABLE](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_FIRST_NAME] [varchar](200) NOT NULL,
	[USER_LAST_NAME] [varchar](200) NOT NULL,
	[USER_MIDDLE_NAME] [varchar](200) NOT NULL,
	[USER_EMAIL] [varchar](200) NOT NULL,
	[ROLE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[COURSE_LINK]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_LINK_COURCE] FOREIGN KEY([COURSE_ID])
REFERENCES [dbo].[COURSE] ([COURSE_ID])
GO
ALTER TABLE [dbo].[COURSE_LINK] CHECK CONSTRAINT [FK_COURSE_LINK_COURCE]
GO
ALTER TABLE [dbo].[COURSE_LINK]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_LINK_UNIVERSITY] FOREIGN KEY([UNIVERSITY_ID])
REFERENCES [dbo].[UNIVERSITY] ([UNIVERSITY_ID])
GO
ALTER TABLE [dbo].[COURSE_LINK] CHECK CONSTRAINT [FK_COURSE_LINK_UNIVERSITY]
GO
ALTER TABLE [dbo].[MENU_ITEM_XREF]  WITH CHECK ADD  CONSTRAINT [FK_MENU_ID] FOREIGN KEY([MENU_ID])
REFERENCES [dbo].[MENU] ([MENU_ID])
GO
ALTER TABLE [dbo].[MENU_ITEM_XREF] CHECK CONSTRAINT [FK_MENU_ID]
GO
ALTER TABLE [dbo].[MENU_ITEM_XREF]  WITH CHECK ADD  CONSTRAINT [FK_MENU_SECTION_ID] FOREIGN KEY([MENU_SECTION_ID])
REFERENCES [dbo].[MENU_SECTION] ([MENU_SECTION_ID])
GO
ALTER TABLE [dbo].[MENU_ITEM_XREF] CHECK CONSTRAINT [FK_MENU_SECTION_ID]
GO
ALTER TABLE [dbo].[T_SCREEN_GPO]  WITH CHECK ADD  CONSTRAINT [FK_MENU_OPERA_ID] FOREIGN KEY([MENU_ID])
REFERENCES [dbo].[T_MENU_GPO] ([MENU_ID])
GO
ALTER TABLE [dbo].[T_SCREEN_GPO] CHECK CONSTRAINT [FK_MENU_OPERA_ID]
GO
ALTER TABLE [dbo].[UNIVERSITY_LINK]  WITH CHECK ADD  CONSTRAINT [FK_UNIVERSITY_LINK_STATE] FOREIGN KEY([STATE_ID])
REFERENCES [dbo].[STATE] ([STATE_ID])
GO
ALTER TABLE [dbo].[UNIVERSITY_LINK] CHECK CONSTRAINT [FK_UNIVERSITY_LINK_STATE]
GO
ALTER TABLE [dbo].[USER_TABLE]  WITH CHECK ADD  CONSTRAINT [FK_ROLE_ID] FOREIGN KEY([ROLE_ID])
REFERENCES [dbo].[ROLE] ([ROLE_ID])
GO
ALTER TABLE [dbo].[USER_TABLE] CHECK CONSTRAINT [FK_ROLE_ID]
GO
/****** Object:  StoredProcedure [dbo].[GPO_MENU_PROFILE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GPO_MENU_PROFILE]
(
@V_PROFILEID VARCHAR(10)
)
AS
--DECLARE @V_PROFILEID VARCHAR(10)
--SET @V_PROFILEID='PRF0000008'
BEGIN

	SELECT MENU_ID,MENU_NAME, 
	ISNULL(PARENT_MENU_ID,'') AS PARENT_MENU_ID
	FROM T_MENU_GPO AS MAINMENU WHERE MENU_LEVEL=1 ORDER BY MENU_ORDER ASC

	SELECT MO.MENU_ID, MO.MENU_NAME,MO.MENU_LEVEL,
	ISNULL(PARENT_MENU_ID,'') AS PARENT_MENU_ID,
	SO.SCREEN_MNEMONIC, SO.SCREEN_NAME,
	SPO.ACCESS_TYPE
	FROM T_REF_SCREEN_PROFILE_GPO SPO LEFT OUTER JOIN T_SCREEN_GPO SO ON
	SO.SCREEN_ID=SPO.SCREEN_ID
	LEFT OUTER JOIN T_MENU_GPO MO ON SO.MENU_ID=MO.MENU_ID
	WHERE SPO.PROFILE_ID=@V_PROFILEID
	AND SO.MENU_ID IS NOT NULL
	AND MO.MENU_LEVEL=2
	ORDER BY PARENT_MENU_ID,MENU_ORDER

	SELECT MO.MENU_ID, MO.MENU_NAME,MO.MENU_LEVEL,
	ISNULL(PARENT_MENU_ID,'') AS PARENT_MENU_ID,
	SO.SCREEN_MNEMONIC, SO.SCREEN_NAME,
	SPO.ACCESS_TYPE
	FROM T_REF_SCREEN_PROFILE_GPO SPO LEFT OUTER JOIN T_SCREEN_GPO SO ON
	SO.SCREEN_ID=SPO.SCREEN_ID
	LEFT OUTER JOIN T_MENU_GPO MO ON SO.MENU_ID=MO.MENU_ID
	WHERE SPO.PROFILE_ID=@V_PROFILEID
	AND SO.MENU_ID IS NOT NULL
	AND MO.MENU_LEVEL=3
	ORDER BY PARENT_MENU_ID,MENU_ORDER
END

GO
/****** Object:  StoredProcedure [dbo].[InsertGenerator]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[InsertGenerator]
(@tableName varchar(100)) as

--Declare a cursor to retrieve column specific information for the specified table
DECLARE cursCol CURSOR FAST_FORWARD FOR 
SELECT column_name,data_type FROM information_schema.columns WHERE table_name = @tableName
OPEN cursCol
DECLARE @string nvarchar(3000) --for storing the first half of INSERT statement
DECLARE @stringData nvarchar(3000) --for storing the data (VALUES) related statement
DECLARE @dataType nvarchar(1000) --data types returned for respective columns
SET @string='INSERT '+@tableName+'('
SET @stringData=''

DECLARE @colName nvarchar(50)

FETCH NEXT FROM cursCol INTO @colName,@dataType

IF @@fetch_status<>0
	begin
	print 'Table '+@tableName+' not found, processing skipped.'
	close curscol
	deallocate curscol
	return
END

WHILE @@FETCH_STATUS=0
BEGIN
IF @dataType in ('varchar','char','nchar','nvarchar')
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull('+@colName+','''')+'''''',''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+'+@colName+'+'''''+''''',''NULL'')+'',''+'
END
ELSE
if @dataType in ('text','ntext') --if the datatype is text or something else 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(2000)),'''')+'''''',''+'
END
ELSE
IF @dataType = 'money' --because money doesn't get converted from varchar implicitly
BEGIN
	SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
END
ELSE 
IF @dataType='datetime'
BEGIN
	--SET @stringData=@stringData+'''convert(datetime,''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+''''''),''+'
	--SELECT 'INSERT Authorizations(StatusDate) VALUES('+'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
	--SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
	SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
  --                             'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
END
ELSE 
IF @dataType='image' 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast(convert(varbinary,'+@colName+') as varchar(6)),''0'')+'''''',''+'
END
ELSE --presuming the data type is int,bit,numeric,decimal 
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+'''''',''+'
	--SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+')+'''''+''''',''NULL'')+'',''+'
END

SET @string=@string+@colName+','

FETCH NEXT FROM cursCol INTO @colName,@dataType
END
DECLARE @Query nvarchar(4000)

SET @query ='SELECT '''+substring(@string,0,len(@string)) + ') VALUES(''+ ' + substring(@stringData,0,len(@stringData)-2)+'''+'')'' FROM '+@tableName
exec sp_executesql @query
--select @query

CLOSE cursCol
DEALLOCATE cursCol

GO
/****** Object:  StoredProcedure [dbo].[PROC_ASSIGN_PAPER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_ASSIGN_PAPER]      
(      
   @UNIVERSITY_ID INT
  ,@COURSE_ID INT  
  ,@SEMISTER_ID INT  
  ,@SUBJECT_ID INT  
  ,@PAPER_ID INT  
  
)  
  
AS      
BEGIN  
IF(
SELECT COUNT(*) FROM PAPER_LINK
WHERE
UNIVERSITY_ID=@UNIVERSITY_ID
AND COURSE_ID=@COURSE_ID
AND SEMISTER_ID=@SEMISTER_ID
AND SUBJECT_ID=@SUBJECT_ID
AND PAPER_ID=@PAPER_ID
)=0
INSERT INTO [PAPER_LINK]
           ([UNIVERSITY_ID]
           ,[COURSE_ID]
           ,[SEMISTER_ID]
           ,[SUBJECT_ID]
           ,[PAPER_ID]
           )
     VALUES
           (@UNIVERSITY_ID
           ,@COURSE_ID
           ,@SEMISTER_ID
           ,@SUBJECT_ID
           ,@PAPER_ID
           )
END  


  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[PROC_ASSIGN_SEMISTER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[PROC_ASSIGN_SEMISTER]      
(      
   @UNIVERSITY_ID INT
  ,@COURSE_ID INT  
  ,@SEMISTER_ID INT  
  
  
)  
  
AS      
BEGIN  
IF(
SELECT COUNT(*) FROM SEMISTER_LINK
WHERE
UNIVERSITY_ID=@UNIVERSITY_ID
AND COURSE_ID=@COURSE_ID
AND SEMISTER_ID=@SEMISTER_ID
)=0
INSERT INTO [SEMISTER_LINK]
           ([UNIVERSITY_ID]
           ,[COURSE_ID]
           ,[SEMISTER_ID]
          )
     VALUES
           (@UNIVERSITY_ID
           ,@COURSE_ID
           ,@SEMISTER_ID
           )
END  


  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[PROC_ASSIGN_SUBJECT]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_ASSIGN_SUBJECT]      
(      
  @UNIVERSITY_ID INT
  ,@COURSE_ID INT  
  ,@SEMISTER_ID INT  
  ,@SUBJECT_ID INT  
  
)  
  
AS      
BEGIN  
IF(
SELECT COUNT(*) FROM SUBJECT_LINK
WHERE
UNIVERSITY_ID=@UNIVERSITY_ID
AND COURSE_ID=@COURSE_ID
AND SEMISTER_ID=@SEMISTER_ID
AND SUBJECT_ID=@SUBJECT_ID
)=0
INSERT INTO [SUBJECT_LINK]
           ([UNIVERSITY_ID]
           ,[COURSE_ID]
           ,[SEMISTER_ID]
           ,[SUBJECT_ID])
     VALUES
           (@UNIVERSITY_ID
           ,@COURSE_ID
           ,@SEMISTER_ID
           ,@SUBJECT_ID)
END  


  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_COURSE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_COURSE]    
(    
@UNIVERSITY_ID VARCHAR(10)    
)    
AS    
BEGIN    
SELECT C.COURSE_ID,C.COURSE_NAME 
FROM COURSE  C INNER JOIN COURSE_LINK CL
ON C.COURSE_ID=CL.COURSE_ID 
WHERE CL.UNIVERSITY_ID=@UNIVERSITY_ID    

END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_COURSE_ALL]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_COURSE_ALL]    
AS    
BEGIN    
SELECT C.COURSE_ID,C.COURSE_NAME 
FROM COURSE  C 
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_FILE_PATH]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_FILE_PATH]    
(    

 @FILE_INFO_ID INT

)

AS    
BEGIN    
  SELECT FILE_PATH FROM FILE_INFO
WHERE FILEINFO_ID=@FILE_INFO_ID
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_PAPER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_PAPER]    
(
@SUBJECT_ID INT
,@COURSE_ID INT  
,@SEMISTER_ID int  
,@UNIVERSITY_ID INT
)    
AS    
BEGIN    
SELECT P.PAPER_ID,P.PAPER_NAME FROM PAPER P  
INNER JOIN PAPER_LINK PL ON P.PAPER_ID=PL.PAPER_ID  
WHERE 
PL.SUBJECT_ID=@SUBJECT_ID 
AND PL.COURSE_ID=@COURSE_ID 
AND PL.SEMISTER_ID=@SEMISTER_ID  
AND PL.UNIVERSITY_ID=@UNIVERSITY_ID    
END  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_PAPER_ALL]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_GET_PAPER_ALL]      
AS      
BEGIN      
SELECT C.PAPER_ID,C.PAPER_NAME   
FROM PAPER  C   
END  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_SEMISTER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
--EXEC PROC_GET_SEMISTER '1','1','1'  
  
CREATE PROCEDURE [dbo].[PROC_GET_SEMISTER]      
(  

@UNIVERSITY_ID INT  
,@COURCE_ID INT  
  
)      
AS      
BEGIN      
SELECT SEM.SEMISTER_ID,SEM.SEMISTER_NAME FROM SEMISTER    
SEM  INNER JOIN SEMISTER_LINK SEML ON SEM.SEMISTER_ID=    
SEML.SEMISTER_ID     
WHERE SEML.COURSE_ID=@COURCE_ID   
AND SEML.UNIVERSITY_ID=@UNIVERSITY_ID   

END    
  
  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_SEMISTER_ALL]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_SEMISTER_ALL]    
AS    
BEGIN    
SELECT C.SEMISTER_ID,C.SEMISTER_NAME 
FROM SEMISTER  C 
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_STATE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_STATE]
AS
BEGIN
SELECT STATE_ID,STATE_NAME FROM STATE
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_SUBJECT]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
CREATE PROCEDURE [dbo].[PROC_GET_SUBJECT]  
(  
 @COURSE_ID INT  
,@SEMISTER_ID int  
,@UNIVERSITY_ID INT

)  
AS  
BEGIN  
IF(@SEMISTER_ID=0)  
SELECT S.SUBJECT_ID,S.SUBJECT_NAME   
FROM SUBJECT S INNER JOIN SUBJECT_LINK SL ON S.SUBJECT_ID=SL.SUBJECT_ID  
WHERE
SL.COURSE_ID=@COURSE_ID 
AND SEMISTER_ID=@SEMISTER_ID  
AND SL.UNIVERSITY_ID=@UNIVERSITY_ID 
ELSE  
SELECT S.SUBJECT_ID,S.SUBJECT_NAME   
FROM SUBJECT S INNER JOIN SUBJECT_LINK SL ON S.SUBJECT_ID=SL.SUBJECT_ID  
WHERE 
SL.COURSE_ID=@COURSE_ID 
AND SEMISTER_ID=@SEMISTER_ID  
AND SL.UNIVERSITY_ID=@UNIVERSITY_ID 
  
END  
  

  

  
  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_SUBJECT_ALL]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_SUBJECT_ALL]      
AS      
BEGIN      
SELECT C.SUBJECT_ID,C.SUBJECT_NAME   
FROM SUBJECT  C   
END  
GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_UNIVERSITY]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_GET_UNIVERSITY]
(@STATE_ID INT)
AS
BEGIN
    SET NOCOUNT ON;
SELECT UNIVERSITY_ID,UNIVERSITY_NAME FROM UNIVERSITY    
WHERE STATE_ID=@STATE_ID
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_GET_USER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_GET_USER]    
(    
  @USER_ID VARCHAR(100)
 ,@PASSWORD VARCHAR(20)

)

AS    
BEGIN 

SELECT FIRST_NAME +' '+LAST_NAME,LOGIN_USER_ID,PROFILE_ID  FROM T_USER_GPO
WHERE E_MAIL=@USER_ID AND PASSWORD=@PASSWORD
   
END


GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_COURSE]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_SAVE_COURSE]      
(      
  @COURSE_NAME VARCHAR(200)  
 ,@COURSE_ID INT=NULL  
 ,@UNIVERSITY_ID INT=NULL  
 ,@STATE_ID INT  
 ,@FLAG VARCHAR(1)  
  
)  
  
AS      
BEGIN   
IF( @FLAG='I')    
BEGIN  
IF( SELECT COUNT(*) FROM COURSE WHERE COURSE_NAME=@COURSE_NAME )=0
INSERT INTO COURSE(COURSE_NAME)  
VALUES(@COURSE_NAME)  
END  
IF( @FLAG='U')    
BEGIN  
IF(SELECT COUNT(*) FROM COURSE WHERE COURSE_NAME=@COURSE_NAME 
AND COURSE_ID<>@COURSE_ID)=0
UPDATE COURSE SET COURSE_NAME=@COURSE_NAME   
WHERE COURSE_ID=@COURSE_ID  
END  
IF( @FLAG='A')    
BEGIN  
IF (SELECT COUNT(*) FROM COURSE_LINK   
WHERE COURSE_ID=@COURSE_ID AND UNIVERSITY_ID=@UNIVERSITY_ID)=0  
INSERT INTO COURSE_LINK(UNIVERSITY_ID,COURSE_ID)  
VALUES(@UNIVERSITY_ID,@COURSE_ID)  
END  
END  
  
  

GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_FEEDBACK]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_SAVE_FEEDBACK]    
(    
  @NAME VARCHAR(100)
 ,@E_MAIL VARCHAR(100)
 ,@MOBILE VARCHAR(20)
 ,@MESSGE VARCHAR(7500)
 

)

AS    
BEGIN 
INSERT INTO [FEEDBACK_GPO]
           ([NAME]
           ,[E_MAIL]
           ,[MOBILE]
           ,[MESSGE])
     VALUES
           (@NAME
           ,@E_MAIL
           ,@MOBILE
           ,@MESSGE)

		
END

   



GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_FILE_PATH]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_SAVE_FILE_PATH]    
(    

 @STATE_ID INT
,@UNIVERSITY_ID INT
,@COURSE_ID INT
,@YEAR INT
,@SEMISTER_ID INT
,@SUBJECT_ID INT
,@PAPER_ID INT
,@FILE_PATH VARCHAR(2000)
,@DESCRIPTION VARCHAR(200)
)

AS    
BEGIN    
   INSERT INTO [FILE_INFO]
           ([STATE_ID]
           ,[UNIVERSITY_ID]
           ,[COURSE_ID]
           ,[YEAR]
           ,[SEMISTER_ID]
           ,[SUBJECT_ID]
           ,[PAPER_ID]
           ,[FILE_PATH]
           ,[DESCRIPTION])
     VALUES
           (
            @STATE_ID 
			,@UNIVERSITY_ID 
			,@COURSE_ID 
			,@YEAR 
			,@SEMISTER_ID 
			,@SUBJECT_ID 
			,@PAPER_ID 
			,@FILE_PATH 
			,@DESCRIPTION 
           )
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_PAPER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[PROC_SAVE_PAPER]        
(        
  @PAPER_ID INT=NULL    
 ,@PAPER_NAME VARCHAR(100)   
 ,@FLAG VARCHAR(1)    
)    
    
AS        
BEGIN     
    
declare @PAPERNew_Id int    
    
IF( @FLAG='I')      
BEGIN    
IF(SELECT COUNT(*) FROM PAPER   
WHERE  PAPER_NAME=@PAPER_NAME)=0  
BEGIN  
INSERT INTO PAPER(PAPER_NAME)    
VALUES(@PAPER_NAME)    
SET @PAPERNew_Id=@@identity    
END  
ELSE  
SET @PAPERNew_Id='9999'  
    
END    
IF( @FLAG='U')      
BEGIN    
IF(SELECT COUNT(*) FROM PAPER   
WHERE  PAPER_NAME=@PAPER_NAME AND PAPER_ID<>@PAPER_ID)=0 
UPDATE PAPER SET PAPER_NAME=@PAPER_NAME     
WHERE PAPER_ID=@PAPER_ID    
END    
    
       
END    
    
    
    
    
GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_SEMISTER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[PROC_SAVE_SEMISTER]          
(          
  @SEMISTER_ID INT=NULL      
 ,@SEMISTER_NAME VARCHAR(100)     
 ,@FLAG VARCHAR(1)      
)      
      
AS          
BEGIN       
      
declare @SEMISTERNew_Id int      
      
IF( @FLAG='I')        
BEGIN      
IF(SELECT COUNT(*) FROM SEMISTER     
WHERE  SEMISTER_NAME=@SEMISTER_NAME)=0    
BEGIN    
INSERT INTO SEMISTER(SEMISTER_NAME)      
VALUES(@SEMISTER_NAME)      
SET @SEMISTER_Id=@@identity      
END    
ELSE    
SET @SEMISTER_Id='9999'    
      
END      
IF( @FLAG='U')        
BEGIN    
IF(SELECT COUNT(*) FROM SEMISTER     
WHERE  SEMISTER_NAME=@SEMISTER_NAME AND SEMISTER_ID<>@SEMISTER_ID)=0   
UPDATE SEMISTER SET SEMISTER_NAME=@SEMISTER_NAME       
WHERE SEMISTER_ID=@SEMISTER_ID      
END      
      
         
END      
      
      
      
GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_SUBJECT]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_SAVE_SUBJECT]        
(        
  @SUBJECT_ID INT=NULL    
 ,@SUBJECT_NAME VARCHAR(100)   
 ,@FLAG VARCHAR(1)    
)    
    
AS        
BEGIN     
    
declare @SubjectNew_Id int    
    
IF( @FLAG='I')      
BEGIN    
IF(SELECT COUNT(*) FROM SUBJECT   
WHERE  SUBJECT_NAME=@SUBJECT_NAME)=0  
BEGIN  
INSERT INTO SUBJECT(SUBJECT_NAME)    
VALUES(@SUBJECT_NAME)    
SET @SubjectNew_Id=@@identity    
END  
ELSE  
SET @SubjectNew_Id='9999'  
    
END    
IF( @FLAG='U')      
BEGIN    
IF(SELECT COUNT(*) FROM SUBJECT   
WHERE  SUBJECT_NAME=@SUBJECT_NAME AND SUBJECT_ID<>@SUBJECT_ID)=0  
	BEGIN  
	UPDATE SUBJECT SET SUBJECT_NAME=@SUBJECT_NAME     
	WHERE SUBJECT_ID=@SUBJECT_ID    
	END    
	SET @SubjectNew_Id=@SUBJECT_ID 
END
ELSE
SET @SubjectNew_Id='9999' 
    
    RETURN @SubjectNew_Id   
END    
    
    
    
    
GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_UNIVERSITY]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_SAVE_UNIVERSITY]      
(      
  @UNIVERSITY_NAME VARCHAR(200)  
 ,@UNIVERSITY_ID INT=NULL  
 ,@STATE_ID INT  
 ,@FLAG VARCHAR(1)  
  
)  
  
AS      
BEGIN   
IF( @FLAG='I')    
BEGIN  
IF(SELECT COUNT(*) FROM UNIVERSITY WHERE UNIVERSITY_NAME=UNIVERSITY_NAME)=0
INSERT INTO UNIVERSITY(UNIVERSITY_NAME,STATE_ID)  
VALUES(@UNIVERSITY_NAME,@STATE_ID)  
END  
IF( @FLAG='U')    
BEGIN  
IF(SELECT COUNT(*) FROM UNIVERSITY WHERE UNIVERSITY_NAME=UNIVERSITY_NAME
AND UNIVERSITY_ID<>@UNIVERSITY_ID)=0
UPDATE UNIVERSITY SET UNIVERSITY_NAME=@UNIVERSITY_NAME   
WHERE UNIVERSITY_ID=@UNIVERSITY_ID  
END  
     
END  
GO
/****** Object:  StoredProcedure [dbo].[PROC_SAVE_USER]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [PROC_SAVE_USER] 'sowji','talla','sowji.talla@gmail.com','talla123','I'

CREATE PROCEDURE [dbo].[PROC_SAVE_USER]    
(    
  @FIRST_NAME VARCHAR(200)
 ,@LAST_NAME VARCHAR(200)
 ,@E_MAIL VARCHAR(200)
 ,@E_PASSWORD VARCHAR(20)
 ,@FLAG VARCHAR(1)

)

AS    
BEGIN 
IF( @FLAG='I')  
BEGIN
		IF(SELECT COUNT(*)  FROM T_USER_GPO WHERE E_MAIL=@E_MAIL)=0 
			BEGIN
			INSERT INTO T_USER_GPO(FIRST_NAME,LAST_NAME,E_MAIL,PASSWORD,PROFILE_ID)
			VALUES(@FIRST_NAME,@LAST_NAME,@E_MAIL,@E_PASSWORD,'PRF0000007')
		    END
END
IF( @FLAG='U')  
BEGIN
UPDATE T_USER_GPO SET FIRST_NAME=@FIRST_NAME,LAST_NAME=@LAST_NAME
	WHERE E_MAIL=@E_MAIL
END

IF( @FLAG='C')  
BEGIN
	UPDATE T_USER_GPO SET PASSWORD=@E_PASSWORD
	WHERE E_MAIL=@E_MAIL
END
   
END

GO
/****** Object:  StoredProcedure [dbo].[PROC_SEARCH_QUESTION_PAPERS]    Script Date: 10/28/2017 7:24:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
  --EXEC PROC_SEARCH_QUESTION_PAPERS '1','1','1995'
  
CREATE PROCEDURE [dbo].[PROC_SEARCH_QUESTION_PAPERS]        
(        
 @UNIVERSITY_ID VARCHAR(10)        
,@COURSE_ID VARCHAR(10)        
,@YEAR VARCHAR(10)        
)        
AS        
BEGIN        
    SET NOCOUNT ON;        
SELECT 
FILEINFO_ID
,U.UNIVERSITY_NAME
,YEAR      
,C.COURSE_NAME
,S.SUBJECT_NAME
,FILE_PATH
,DESCRIPTION 
FROM FILE_INFO        
FI     
INNER JOIN SUBJECT S ON FI.SUBJECT_ID=S.SUBJECT_ID  
INNER JOIN SUBJECT_LINK SL ON SL.SUBJECT_ID=S.SUBJECT_ID
INNER JOIN COURSE C ON C.COURSE_ID=SL.COURSE_ID 
INNER JOIN UNIVERSITY U ON U.UNIVERSITY_ID=SL.UNIVERSITY_ID    

WHERE U.UNIVERSITY_ID=@UNIVERSITY_ID 
AND FI.YEAR=@YEAR 
AND C.COURSE_ID=@COURSE_ID      
END    
  
  
  
GO
