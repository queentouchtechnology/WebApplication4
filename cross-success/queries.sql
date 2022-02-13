
CREATE DATABASE cross_success;

/*
imman_dark_user
Rr2~96mf
*/


create table [cross_success].[dbo].[users]
(
user_id int PRIMARY KEY,
user_name varchar(50) UNIQUE,
user_pass varchar(50),
user_mobile varchar(50) UNIQUE,
user_email varchar(50) UNIQUE,
user_type varchar(50),
isuser_logged varchar(50),
user_logged_ip varchar(50),
user_lastup_dt datetime,
user_date datetime
)


create table [cross_success].[dbo].[categories]
(
cat_id int PRIMARY KEY,
cat_name varchar(50),
cat_desc varchar(MAX)
)

select Versecount from [cross_success].[dbo].[new_bible] where book= '0' and chapter='1' order by Versecount asc  GROUP BY tam_bookname,Book

select distinct t1.chapter 
from 
(
select [cross_success].[dbo].[new_bible].chapter,[cross_success].[dbo].[new_bible].ID from [cross_success].[dbo].[new_bible]

LEFT OUTER JOIN [cross_success].[dbo].[topics]

on [cross_success].[dbo].[new_bible].ID=[cross_success].[dbo].[topics].topic_cat_id
 where [cross_success].[dbo].[new_bible].book = '0' 
 
 ) t1 order by t1.chapter desc


 Select [cross_success].[dbo].[new_bible].tam_bookname,[cross_success].[dbo].[new_bible].tam_verse,
 topic_desc from [cross_success].[dbo].[topics]
 LEFT OUTER JOIN [cross_success].[dbo].[new_bible]
 on [cross_success].[dbo].[new_bible].ID=[cross_success].[dbo].[topics].topic_cat_id
 where [cross_success].[dbo].[new_bible].book='0' 
 and [cross_success].[dbo].[new_bible].chapter='1'
 and [cross_success].[dbo].[new_bible].Versecount='1' and topic_desc!=''


 select top 1 * from [cross_success].[dbo].[new_bible] where book='0' and chapter='1' and Versecount='1'


SELECT home, MAX(datetime) AS MaxDateTime

    FROM topten

    GROUP BY home


select top 1 * from [cross_success].[dbo].[new_bible]
select top 10 * from [cross_success].[dbo].[topics]

alter table [cross_success].[dbo].[topics] add id int IDENTITY(1,1)


delete from [cross_success].[dbo].[topics] where topic_cat_id='1'


 SELECT top 10  [cross_success].[dbo].[new_bible].tam_verse,[cross_success].[dbo].[topics].topic_desc
   
   FROM [cross_success].[dbo].[new_bible]
   
    LEFT JOIN [cross_success].[dbo].[topics] 
	
   ON [cross_success].[dbo].[new_bible].ID = [cross_success].[dbo].[topics].topic_cat_id 
   
   where [cross_success].[dbo].[topics].topic_desc!=''

   order by [cross_success].[dbo].[topics].id desc


create table [cross_success].[dbo].[topics]
(
topic_id int PRIMARY KEY,
topic_name nvarchar(50),
topic_desc nvarchar(MAX),
topic_date datetime,
topic_cat_id int,
topic_user_id int
)

SELECT top 10 * FROM [cross_success].[dbo].[topics] WHERE [cross_success].[dbo].[topics].topic_cat_id = '16622'

create table [cross_success].[dbo].[replies]
(
reply_id int PRIMARY KEY,
reply_content varchar(MAX),
reply_date datetime,
reply_topic_id int,
reply_user_id int,
reply_for_user_id int
)

create table [cross_success].[dbo].[activity_log]
(
activity_id int PRIMARY KEY,
activity_title varchar(MAX),
activity_content varchar(MAX),
activity_date datetime,
activity_ip varchar(50),
activity_user_id int
)

select * from [cross_success].[dbo].[users]
select * from  [cross_success].[dbo].[activity_log]
select * from  [cross_success].[dbo].[categories]
select * from  [cross_success].[dbo].[topics]

select * from  [cross_success].[dbo].[bible]


drop table [cross_success].[dbo].[bible]



delete from  [cross_success].[dbo].[topics]
delete from  [cross_success].[dbo].[users]
drop table [cross_success].[dbo].[topics]

Alter table [cross_success].[dbo].[new_bible] ADD tam_bookname nvarchar(MAX)
Alter table [cross_success].[dbo].[new_bible] ADD eng_bookname nvarchar(MAX)

select MIN(chapter),MAX(chapter) from  [cross_success].[dbo].[bible] where bookname=N'சங்கீதம்'

select bookname,book,MIN(chapter) as bookstart,MAX(chapter) as bookend from  [cross_success].[dbo].[bible] where bookname IS NOT NULL group by bookname,book order by book asc 
select MIN(chapter),MAX(chapter) from  [cross_success].[dbo].[bible] where book='18'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஆதியாகமம்' where book='0'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'யாத்திராகமம்' where book='1'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'லேவியராகமம்' where book='2'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எண்ணாகமம்' where book='3'
update [cross_success].[dbo].[new_bible] set tam_bookname= N' உபாகமம்' where book='4'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'யோசுவா' where book='5'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'நியாயாதிபதிகள்' where book='6'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ரூத்' where book='7'
update [cross_success].[dbo].[new_bible] set tam_bookname= N' I சாமுவேல்' where book='8'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II சாமுவேல்' where book='9'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'I இராஜாக்கள்' where book='10'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II இராஜாக்கள்' where book='11'
update [cross_success].[dbo].[new_bible] set tam_bookname= N' I நாளாகமம்' where book='12'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II நாளாகமம்' where book='13'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எஸ்றா' where book='14'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'நெகேமியா' where book='15'
update [cross_success].[dbo].[new_bible] set tam_bookname= N' எஸ்தர்' where book='16'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'யோபு' where book='17'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'சங்கீதம்' where book='18'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'நீதிமொழிகள்' where book='19'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'பிரசங்கி' where book='20'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'உன்னதப்பாட்டு' where book='21'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஏசாயா' where book='22'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எரேமியா' where book='23'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'புலம்பல்' where book='24'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எசேக்கியேல்' where book='25'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'தானியேல்' where book='26'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஓசியா' where book='27'
update [cross_success].[dbo].[new_bible] set tam_bookname= N' யோவேல்' where book='28'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஆமோஸ்' where book='29'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஒபதியா' where book='30'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'யோனா' where book='31'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'மீகா' where book='32'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'நாகூம்' where book='33'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஆபகூக்' where book='34'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'செப்பனியா' where book='35'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ஆகாய்' where book='36'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'சகரியா' where book='37'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'மல்கியா' where book='38'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'மத்தேயு ' where book='39'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'மாற்கு' where book='40'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'லூக்கா' where book='41'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'யோவான்' where book='42'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'அப்போஸ்தலர்' where book='43'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'ரோமர்' where book='44'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'I கொரிந்தியர்' where book='45'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II கொரிந்தியர்' where book='46'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'கலாத்தியர்' where book='47'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எபேசியர்' where book='48'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'பிலிப்பியர்' where book='49'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'கொலோசெயர்' where book='50'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'I தெசலோனிக்கேயர்' where book='51'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II தெசலோனிக்கேயர்' where book='52'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'I தீமோத்தேயு' where book='53'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II தீமோத்தேயு' where book='54'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'தீத்து' where book='55'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'பிலேமோன்' where book='56'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'எபிரெயர்' where book='57'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'யாக்கோபு' where book='58'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'I பேதுரு' where book='59'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II பேதுரு' where book='60'

update [cross_success].[dbo].[new_bible] set tam_bookname= N'I யோவான்' where book='61'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'II யோவான்' where book='62'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'III யோவான்' where book='63'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'யூதா' where book='64'
update [cross_success].[dbo].[new_bible] set tam_bookname= N'வெளிப்படுத்தல்' where book='65'

ALTER TABLE [cross_success].[dbo].[bible] DROP COLUMN tam_verse;

CREATE TABLE [cross_success].[dbo].[new_bible] ("Book" int DEFAULT NULL, "Chapter" int DEFAULT null, "Versecount" int DEFAULT null, "eng_verse" nvarchar(528), "tam_verse" nvarchar(528),"hindi_verse" nvarchar(528));





/* START TAMIL ENGLISH BIBLE*/
INSERT INTO [cross_success].[dbo].[new_bible](book,chapter,versecount,eng_verse,tam_verse)

SELECT [cross_success].[dbo].[bible].book,[cross_success].[dbo].[bible].chapter,[cross_success].[dbo].[bible].versecount,[cross_success].[dbo].[eng-bible].verse,[cross_success].[dbo].[bible].verse

FROM		[cross_success].[dbo].[bible] 

INNER JOIN	[cross_success].[dbo].[eng-bible] 
ON 
	[cross_success].[dbo].[bible].book = [cross_success].[dbo].[eng-bible].book
AND [cross_success].[dbo].[bible].chapter=[cross_success].[dbo].[eng-bible].chapter 
AND [cross_success].[dbo].[bible].versecount=[cross_success].[dbo].[eng-bible].versecount;


/* END TAMIL ENGLISH BIBLE*/

/* START NEW  ENGLISH BIBLE*/

INSERT INTO [cross_success].[dbo].[new_bible](book,chapter,versecount,eng_verse,tam_verse)

SELECT [cross_success].[dbo].[bible].book,[cross_success].[dbo].[bible].chapter,[cross_success].[dbo].[bible].versecount,[cross_success].[dbo].[eng-bible].verse,[cross_success].[dbo].[bible].verse

FROM		[cross_success].[dbo].[bible] 

INNER JOIN	[cross_success].[dbo].[eng-bible] 
ON 
	[cross_success].[dbo].[bible].book = [cross_success].[dbo].[eng-bible].book
AND [cross_success].[dbo].[bible].chapter=[cross_success].[dbo].[eng-bible].chapter 
AND [cross_success].[dbo].[bible].versecount=[cross_success].[dbo].[eng-bible].versecount;

/* END NEW  ENGLISH BIBLE*/





select COUNT(*) from  [cross_success].[dbo].[hindi-bible]
select COUNT(*) from  [cross_success].[dbo].[malayalam-bible]
select * from [cross_success].[dbo].[topics]
delete from [cross_success].[dbo].[new_bible]

select top 100 * from  [cross_success].[dbo].[new_bible] where book='0' and chapter='1'

update [cross_success].[dbo].[users] set user_pass='Q@123456'

ALTER TABLE [cross_success].[dbo].[new_bible]
   ADD ID INT IDENTITY

   ALTER TABLE [cross_success].[dbo].[new_bible]
   ADD CONSTRAINT PK_new_bible
   PRIMARY KEY(ID)


  