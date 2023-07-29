CREATE DATABASE oppodb

use oppodb

CREATE TABLE countries(
	countryID INT PRIMARY KEY NOT NULL,
	countryName VARCHAR(100)
)

CREATE TABLE experienceLevels(
	levelID INT PRIMARY KEY NOT NULL,
	levelName VARCHAR(100)
)

CREATE TABLE jobTypes(
	typeID INT PRIMARY KEY NOT NULL,
	typeName VARCHAR(100)
)

CREATE TABLE companies(
	companyID INT PRIMARY KEY NOT NULL,
	companyName VARCHAR(100)
)

CREATE TABLE jobs(
	jobID INT PRIMARY KEY NOT NULL,
	jobName TEXT,
	jobLocation TEXT,
	salary FLOAT,
	companyID INT FOREIGN KEY REFERENCES companies(companyID),
	levelID INT FOREIGN KEY REFERENCES experienceLevels(levelID),
	countryID INT FOREIGN KEY REFERENCES countries(countryID),
	typeID INT FOREIGN KEY REFERENCES jobTypes(typeID),
)

CREATE TABLE facilities(
	jobID INT,
	facilityName VARCHAR(100),
	PRIMARY KEY (jobID,facilityName),
)

CREATE TABLE requirments(
	jobID INT,
	requirmentName VARCHAR(100),
	PRIMARY KEY (jobID,requirmentName)
)

----- Test queries

SELECT * FROM countries

SELECT * FROM experienceLevels

SELECT * FROM companies

SELECT * FROM jobTypes

SELECT * FROM jobs


SELECT * FROM requirments

SELECT * FROM facilities


ALTER TABLE facilities
ADD FOREIGN KEY (jobID) REFERENCES jobs(JobID)


SELECT companies.companyName, jobs.jobName,jobs.jobLocation,countries.countryName,facilities.facilityName FROM companies,jobs,countries,facilities
where jobs.companyID = companies.companyID 
and jobs.countryID = countries.countryID
and facilities.jobID = jobs.jobID


select facilities.facilityName,COUNT(jobID) from facilities
group by facilities.facilityName

SELECT * FROM jobs
where jobs.jobID  NOT IN (SELECT jobID from requirments)

