/*
Created: 9/14/2012
Modified: 9/14/2012
Model: Microsoft SQL Server 2012
Database: MS SQL Server 2012
*/


-- Create tables section -------------------------------------------------

-- Table professor

CREATE TABLE [professor]
(
 [id] Int NOT NULL,
 [name] Char(256) NULL,
 [lname] Char(256) NULL
)
go

-- Add keys for table professor

ALTER TABLE [professor] ADD CONSTRAINT [id] PRIMARY KEY ([id])
go

-- Table teaches

CREATE TABLE [teaches]
(
 [id] Int NOT NULL
)
go

-- Add keys for table teaches

ALTER TABLE [teaches] ADD CONSTRAINT [Key2] PRIMARY KEY ([id])
go

-- Table course

CREATE TABLE [course]
(
 [id] Int NOT NULL,
 [name] Char(256) NULL
)
go

-- Add keys for table course

ALTER TABLE [course] ADD CONSTRAINT [id] PRIMARY KEY ([id])
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

-- Add keys for table student

ALTER TABLE [student] ADD CONSTRAINT [Key4] PRIMARY KEY ([id])
go

-- Table attends

CREATE TABLE [attends]
(
 [id] Int NOT NULL,
 [id] Int NOT NULL,
 [mark] Int NULL
)
go

-- Add keys for table attends

ALTER TABLE [attends] ADD CONSTRAINT [Key5] PRIMARY KEY ([id],[id])
go

-- Table report

CREATE TABLE [report]
(
 [pid] Int NOT NULL,
 [full_report] Xml NULL,
 [id] Int NOT NULL
)
go

-- Add keys for table report

ALTER TABLE [report] ADD CONSTRAINT [id] PRIMARY KEY ([id])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [teaches] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([id]) REFERENCES [professor] ([id])
go

ALTER TABLE [attends] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([id]) REFERENCES [course] ([id])
go

ALTER TABLE [attends] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([id]) REFERENCES [student] ([id])
go

ALTER TABLE [teaches] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([id], [id]) REFERENCES [attends] ([id], [id])
go

ALTER TABLE [report] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([pid]) REFERENCES [professor] ([id])
go






