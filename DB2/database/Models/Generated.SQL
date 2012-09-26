/*
Created: 9/14/2012
Modified: 9/15/2012
Model: Microsoft SQL Server 2012
Database: MS SQL Server 2012
*/

-- Drop relationships section -------------------------------------------------

ALTER TABLE [teaches] DROP CONSTRAINT [Relationship10]
go
ALTER TABLE [teaches] DROP CONSTRAINT [Relationship9]
go
ALTER TABLE [report] DROP CONSTRAINT [Relationship8]
go
ALTER TABLE [attends] DROP CONSTRAINT [Relationship6]
go
ALTER TABLE [attends] DROP CONSTRAINT [Relationship5]
go




-- Drop keys for tables section -------------------------------------------------

ALTER TABLE [teaches] DROP CONSTRAINT [Key6]
go
ALTER TABLE [report] DROP CONSTRAINT [rep_key]
go
ALTER TABLE [attends] DROP CONSTRAINT [Key5]
go
ALTER TABLE [student] DROP CONSTRAINT [Key4]
go
ALTER TABLE [course] DROP CONSTRAINT [course_key]
go
ALTER TABLE [professor] DROP CONSTRAINT [prof_key]
go


-- Drop indexes section -------------------------------------------------

DROP INDEX [Index1] ON [report]
go
DROP INDEX [Index2] ON [report]
go
DROP INDEX [Index3] ON [attends]
go
DROP INDEX [Index4] ON [attends]
go
DROP INDEX [Index1] ON [student]
go
DROP INDEX [Index2] ON [student]
go
DROP INDEX [Index3] ON [student]
go
DROP INDEX [Index1] ON [course]
go
DROP INDEX [Index2] ON [course]
go
DROP INDEX [Index1] ON [professor]
go
DROP INDEX [Index2] ON [professor]
go
DROP INDEX [Index3] ON [professor]
go

-- Drop tables section ---------------------------------------------------

DROP TABLE [teaches]
go
DROP TABLE [report]
go
DROP TABLE [attends]
go
DROP TABLE [student]
go
DROP TABLE [course]
go
DROP TABLE [professor]
go

-- Create tables section -------------------------------------------------

-- Table professor

CREATE TABLE [professor]
(
 [id] Int NOT NULL,
 [name] Char(256) NULL,
 [lname] Char(256) NULL
)
go

-- Create indexes for table professor

CREATE INDEX [Index1] ON [professor] ([id])
go

CREATE INDEX [Index2] ON [professor] ([name])
go

CREATE INDEX [Index3] ON [professor] ([name],[lname])
go

-- Add keys for table professor

ALTER TABLE [professor] ADD CONSTRAINT [prof_key] PRIMARY KEY ([id])
go

-- Table course

CREATE TABLE [course]
(
 [id] Int NOT NULL,
 [name] Char(256) NULL
)
go

-- Create indexes for table course

CREATE INDEX [Index1] ON [course] ([id])
go

CREATE INDEX [Index2] ON [course] ([name])
go

-- Add keys for table course

ALTER TABLE [course] ADD CONSTRAINT [course_key] PRIMARY KEY ([id])
go

-- Table student

CREATE TABLE [student]
(
 [id] Int NOT NULL,
 [name] Char(256) NULL,
 [lname] Char(256) NULL,
 [absence] Int NULL
)
go

-- Create indexes for table student

CREATE INDEX [Index1] ON [student] ([id])
go

CREATE INDEX [Index2] ON [student] ([name])
go

CREATE INDEX [Index3] ON [student] ([name],[lname])
go

-- Add keys for table student

ALTER TABLE [student] ADD CONSTRAINT [Key4] PRIMARY KEY ([id])
go

-- Table attends

CREATE TABLE [attends]
(
 [cid] Int NOT NULL,
 [sid] Int NOT NULL,
 [mark] Int NULL
)
go

-- Create indexes for table attends

CREATE INDEX [Index3] ON [attends] ([cid],[sid])
go

CREATE INDEX [Index4] ON [attends] ([sid],[cid])
go

-- Add keys for table attends

ALTER TABLE [attends] ADD CONSTRAINT [Key5] PRIMARY KEY ([cid],[sid])
go

-- Table report

CREATE TABLE [report]
(
 [pid] Int NOT NULL,
 [full_report] Xml NULL,
 [id] Int NOT NULL
)
go

-- Create indexes for table report

CREATE INDEX [Index1] ON [report] ([pid])
go

CREATE INDEX [Index2] ON [report] ([id])
go

-- Add keys for table report

ALTER TABLE [report] ADD CONSTRAINT [rep_key] PRIMARY KEY ([id])
go

-- Table teaches

CREATE TABLE [teaches]
(
 [cid] Int NOT NULL,
 [sid] Int NOT NULL,
 [id] Int NOT NULL
)
go

-- Add keys for table teaches

ALTER TABLE [teaches] ADD CONSTRAINT [Key6] PRIMARY KEY ([cid],[sid],[id])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [attends] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([cid]) REFERENCES [course] ([id])
go

ALTER TABLE [attends] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([sid]) REFERENCES [student] ([id])
go

ALTER TABLE [report] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([pid]) REFERENCES [professor] ([id])
go

ALTER TABLE [teaches] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([cid], [sid]) REFERENCES [attends] ([cid], [sid])
go

ALTER TABLE [teaches] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([id]) REFERENCES [professor] ([id])
go



