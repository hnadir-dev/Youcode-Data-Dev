
CREATE DATABASE githubdb

use githubdb

-- Table Technologies
CREATE TABLE technologies(
	"langID" INT PRIMARY KEY IDENTITY,
	"name" VARCHAR(55) NOT NULL
)

-- Table Owners
CREATE TABLE owners(
	"ownerID" INT PRIMARY KEY IDENTITY,
	"type" VARCHAR(55) NOT NULL
)

-- Table License
CREATE TABLE licenses(
	"licenseID" INT PRIMARY KEY IDENTITY,
	"lkey" VARCHAR(255),
	"name" VARCHAR(255),
	"url" VARCHAR(255),
	"spdxID" VARCHAR(255),
	"nodeID" VARCHAR(255)
)

-- Table Contributors
CREATE TABLE contributors(
	"contributorID" INT PRIMARY KEY IDENTITY,
	"name" VARCHAR(255) NOT NULL
)

-- Table Repositories
CREATE TABLE repositories(
	"repoID" INT PRIMARY KEY IDENTITY,
	"fullName" TEXT NOT NULL,
	"description" TEXT,
	"url" VARCHAR(255),
	"cloneUrl" VARCHAR(255),
	"fork" BIT,
	"watchersCount" INT,
	"forks" INT,
	"createdAt" DATE,
	"updatedAt" DATE,
	"pushedAt" DATE,
	"langID" INT FOREIGN KEY REFERENCES technologies(langID),
	"ownerID" INT FOREIGN KEY REFERENCES owners(ownerID),
	"licenseID" INT FOREIGN KEY REFERENCES licenses(licenseID)
)

-- Table Commits
CREATE TABLE commits(
	"repoID" int,
	"contributorID" int,
	counts int,
	PRIMARY KEY CLUSTERED ("repoID", "contributorID"),
	foreign key("repoID") references repositories("repoID"),
	foreign key("contributorID") references contributors("contributorID")
)
--Create indexs

CREATE INDEX reposNameIndex on repositories ("repoID")

CREATE INDEX licenseIdIndex on licenses ("licenseID")

CREATE INDEX contributorNameIndex on contributors ("name")

-- Select with index

SELECT * from repositories
WITH (INDEX(reposNameIndex))

SELECT * from contributors
WITH (INDEX(contributorNameIndex))


--Select 

select * from technologies

select * from owners

select * from licenses

select * from contributors

select * from repositories

select * from commits

