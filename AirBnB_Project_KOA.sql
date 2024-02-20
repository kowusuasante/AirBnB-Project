CREATE DATABASE AIRBNB

USE AIRBNB

CREATE TABLE AirBnB_Weekday (
	index_id						INT IDENTITY	NOT NULL,
	realSum							FLOAT			NULL,
	room_type						NVARCHAR(50)	NULL,
	room_shared						NVARCHAR(5)		NULL,
	room_private					NVARCHAR(5)		NULL,
	person_capacity					INT				NOT NULL,
	host_is_superhost				NVARCHAR(5)		NULL,
	multi							BIT				NOT NULL,
	biz								BIT				NULL,
	cleanliness_rating				INT				NULL,
	guest_satisfaction_overall		INT				NULL,
	bedrooms						INT				NOT NULL,
	dist							FLOAT			NULL,
	metro_dist						FLOAT			NULL,
	attr_index						FLOAT			NULL,
	attr_index_norm					FLOAT			NULL,
	rest_index						FLOAT			NULL,
	rest_index_norm					FLOAT			NULL,
	lng								FLOAT			NULL,
	lat								FLOAT			NULL,
	Country							NVARCHAR(25)	NULL,
	Day_Of_Week						NVARCHAR(10)	NULL
)

SELECT * FROM AirBnB_Weekday


CREATE TABLE AirBnB_Weekend (
	index_id						INT IDENTITY	NOT NULL,
	realSum							FLOAT			NULL,
	room_type						NVARCHAR(50)	NULL,
	room_shared						NVARCHAR(5)		NULL,
	room_private					NVARCHAR(5)		NULL,
	person_capacity					INT				NOT NULL,
	host_is_superhost				NVARCHAR(5)		NULL,
	multi							BIT				NOT NULL,
	biz								BIT				NULL,
	cleanliness_rating				INT				NULL,
	guest_satisfaction_overall		INT				NULL,
	bedrooms						INT				NOT NULL,
	dist							FLOAT			NULL,
	metro_dist						FLOAT			NULL,
	attr_index						FLOAT			NULL,
	attr_index_norm					FLOAT			NULL,
	rest_index						FLOAT			NULL,
	rest_index_norm					FLOAT			NULL,
	lng								FLOAT			NULL,
	lat								FLOAT			NULL,
	Country							NVARCHAR(25)	NULL,
	Day_Of_Week						NVARCHAR(10)	NULL
)

SELECT * FROM AirBnB_Weekend


BULK INSERT AirBnB_Weekday
FROM 'C:\Users\kwabe\Documents\DA_SQL\AirBnB Project\ArBnB Project\budapest_weekdays.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2, -- Skip the header row
    FIELDTERMINATOR = ',', -- Comma is the default field terminator
    ROWTERMINATOR = '\n'   -- Newline is the default row terminator
)


BULK INSERT AirBnB_Weekend
FROM 'C:\Users\kwabe\Documents\DA_SQL\AirBnB Project\ArBnB Project\budapest_weekends.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2, -- Skip the header row
    FIELDTERMINATOR = ',', -- Comma is the default field terminator
    ROWTERMINATOR = '\n'   -- Newline is the default row terminator
)


DROP TABLE AirBnB_Weekend
drop table AirBnB_Weekday

--union all 47685 rows
CREATE VIEW AirBnB_WeekdayWeekend as
select * from AirBnB_Weekend --24259 rows
union all
select * from AirBnB_Weekday -- 23426 rows

--total rows for weekend (24259) + weekday (23426) = 47955

--union 47685 rows
select * from AirBnB_Weekend 
--union 
select * from AirBnB_Weekday


---weekend
ALTER TABLE AirBnB_Weekend
ADD Country nvarchar(25) NULL

ALTER TABLE AirBnB_Weekend
ADD Day_Of_Week nvarchar(10) null

UPDATE AirBnB_Weekend
SET Country = 'Barcelona'  
where Country is null

UPDATE AirBnB_Weekend
SET Day_Of_Week = 'Weekend'  
where Day_Of_Week is null


--weekday
ALTER TABLE AirBnB_Weekday
ADD Country nvarchar(25) NULL

ALTER TABLE AirBnB_Weekday
ADD Day_Of_Week nvarchar(10) null

UPDATE AirBnB_Weekday
SET Country = 'Barcelona'  
where Country is null

UPDATE AirBnB_Weekday
SET Day_Of_Week = 'Weekday'  
where Day_Of_Week is null


select * from AirBnB_Weekday
WHERE Country = 'Vienna'

select * from AirBnB_Weekend
WHERE Country = 'Vienna'

select * from AirBnB_WeekdayWeekend


						