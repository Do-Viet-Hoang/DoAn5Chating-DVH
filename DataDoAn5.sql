CREATE DATABASE Chating
CREATE TABLE Users
(
users_id CHAR(10)PRIMARY KEY,
users_name NVARCHAR(50) NOT NULL,
full_name NVARCHAR(250) NOT NULL,
addresss NVARCHAR(50) NOT NULL,
email NVARCHAR(250) NOT NULL,
SDT CHAR(25)NOT NULL,
friends_counter int,
active_flag int
)

CREATE TABLE MessageGroup
(
Message_group_id  CHAR(10) PRIMARY KEY,
from_user_id CHAR(10) FOREIGN KEY (from_user_id) REFERENCES Users(users_id) ,
to_user_id CHAR(10) FOREIGN KEY (to_user_id) REFERENCES Users(users_id) ,
title nvarchar(250),
last_sending_datetime Datetime,
last_message nvarchar,
mark_reading int
)
CREATE TABLE Meessages
(
Message_id CHAR(10) PRIMARY KEY,
Message_group_id CHAR(10) FOREIGN KEY (Message_group_id) REFERENCES MessageGroup(Message_group_id),
from_user_id CHAR(10) FOREIGN KEY (from_user_id) REFERENCES Users(users_id),
to_user_id CHAR(10) FOREIGN KEY (to_user_id) REFERENCES Users(users_id),
media_flag int,
content Nvarchar(max),
media_file_path Nvarchar(max),
active_flag int
)	
CREATE TABLE MessageGroupMedia
(
Message_media_id  CHAR(10) PRIMARY KEY,
Message_group_id CHAR(10) FOREIGN KEY (Message_group_id) REFERENCES MessageGroup(Message_group_id) ON DELETE CASCADE ON UPDATE CASCADE,
Message_id CHAR(10) FOREIGN KEY (Message_id) REFERENCES Meessages(Message_id),
life_date_time datetime,
file_length bigint
)	
