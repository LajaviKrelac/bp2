/*
Created: 9/15/2012
Modified: 9/15/2012
Project: Postgres
Model: Postgres
Database: PostgreSQL 9.1
*/


-- Drop relationships section -------------------------------------------------

ALTER TABLE "teaches" DROP CONSTRAINT "Relationship10"
;
ALTER TABLE "teaches" DROP CONSTRAINT "Relationship9"
;
ALTER TABLE "report" DROP CONSTRAINT "Relationship8"
;
ALTER TABLE "attends" DROP CONSTRAINT "Relationship6"
;
ALTER TABLE "attends" DROP CONSTRAINT "Relationship5"
;




-- Drop keys for tables section -------------------------------------------------

ALTER TABLE "teaches" DROP CONSTRAINT "Key6"
;
ALTER TABLE "report" DROP CONSTRAINT "rep_key"
;
ALTER TABLE "attends" DROP CONSTRAINT "Key5"
;
ALTER TABLE "student" DROP CONSTRAINT "Key4"
;
ALTER TABLE "course" DROP CONSTRAINT "course_key"
;
ALTER TABLE "professor" DROP CONSTRAINT "prof_key"
;


-- Drop indexes section -------------------------------------------------

DROP INDEX "Index1"
;
DROP INDEX "Index2"
;
DROP INDEX "Index3"
;
DROP INDEX "Index4"
;
DROP INDEX "Index1"
;
DROP INDEX "Index2"
;
DROP INDEX "Index3"
;
DROP INDEX "Index1"
;
DROP INDEX "Index2"
;
DROP INDEX "Index1"
;
DROP INDEX "Index2"
;
DROP INDEX "Index3"
;

-- Drop tables section ---------------------------------------------------

DROP TABLE "teaches"
;
DROP TABLE "report"
;
DROP TABLE "attends"
;
DROP TABLE "student"
;
DROP TABLE "course"
;
DROP TABLE "professor"
;

-- Create tables section -------------------------------------------------

-- Table professor

CREATE TABLE "professor"(
 "id" Integer NOT NULL,
 "name" Character(256),
 "lname" Character(256)
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "professor" IS NULL
;
COMMENT ON COLUMN "professor"."id" IS NULL
;
COMMENT ON COLUMN "professor"."name" IS NULL
;
COMMENT ON COLUMN "professor"."lname" IS NULL
;

-- Create indexes for table professor

CREATE INDEX "Index1" ON "professor" ("id")
;

CREATE INDEX "Index2" ON "professor" ("name")
;

CREATE INDEX "Index3" ON "professor" ("name","lname")
;
COMMENT ON INDEX "Index1" IS NULL
;
COMMENT ON INDEX "Index2" IS NULL
;
COMMENT ON INDEX "Index3" IS NULL
;

-- Add keys for table professor

ALTER TABLE "professor" ADD CONSTRAINT "prof_key" PRIMARY KEY ("id")
;
COMMENT ON CONSTRAINT "prof_key" ON "professor" IS NULL
;

-- Table course

CREATE TABLE "course"(
 "id" Integer NOT NULL,
 "name" Character(256)
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "course" IS NULL
;
COMMENT ON COLUMN "course"."id" IS NULL
;
COMMENT ON COLUMN "course"."name" IS NULL
;

-- Create indexes for table course

CREATE INDEX "Index1" ON "course" ("id")
;

CREATE INDEX "Index2" ON "course" ("name")
;
COMMENT ON INDEX "Index1" IS NULL
;
COMMENT ON INDEX "Index2" IS NULL
;

-- Add keys for table course

ALTER TABLE "course" ADD CONSTRAINT "course_key" PRIMARY KEY ("id")
;
COMMENT ON CONSTRAINT "course_key" ON "course" IS NULL
;

-- Table student

CREATE TABLE "student"(
 "id" Integer NOT NULL,
 "name" Character(256),
 "lname" Character(256),
 "absence" Integer
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "student" IS NULL
;
COMMENT ON COLUMN "student"."id" IS NULL
;
COMMENT ON COLUMN "student"."name" IS NULL
;
COMMENT ON COLUMN "student"."lname" IS NULL
;
COMMENT ON COLUMN "student"."absence" IS NULL
;

-- Create indexes for table student

CREATE INDEX "Index1" ON "student" ("id")
;

CREATE INDEX "Index2" ON "student" ("name")
;

CREATE INDEX "Index3" ON "student" ("name","lname")
;
COMMENT ON INDEX "Index1" IS NULL
;
COMMENT ON INDEX "Index2" IS NULL
;
COMMENT ON INDEX "Index3" IS NULL
;

-- Add keys for table student

ALTER TABLE "student" ADD CONSTRAINT "Key4" PRIMARY KEY ("id")
;
COMMENT ON CONSTRAINT "Key4" ON "student" IS NULL
;

-- Table attends

CREATE TABLE "attends"(
 "cid" Integer NOT NULL,
 "sid" Integer NOT NULL,
 "mark" Integer
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "attends" IS NULL
;
COMMENT ON COLUMN "attends"."cid" IS NULL
;
COMMENT ON COLUMN "attends"."sid" IS NULL
;
COMMENT ON COLUMN "attends"."mark" IS NULL
;

-- Create indexes for table attends

CREATE INDEX "Index3" ON "attends" ("cid","sid")
;

CREATE INDEX "Index4" ON "attends" ("sid","cid")
;
COMMENT ON INDEX "Index3" IS NULL
;
COMMENT ON INDEX "Index4" IS NULL
;

-- Add keys for table attends

ALTER TABLE "attends" ADD CONSTRAINT "Key5" PRIMARY KEY ("cid","sid")
;
COMMENT ON CONSTRAINT "Key5" ON "attends" IS NULL
;

-- Table report

CREATE TABLE "report"(
 "pid" Integer NOT NULL,
 "full_report" XML,
 "id" Integer NOT NULL
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "report" IS NULL
;
COMMENT ON COLUMN "report"."pid" IS NULL
;
COMMENT ON COLUMN "report"."full_report" IS NULL
;
COMMENT ON COLUMN "report"."id" IS NULL
;

-- Create indexes for table report

CREATE INDEX "Index1" ON "report" ("pid")
;

CREATE INDEX "Index2" ON "report" ("id")
;
COMMENT ON INDEX "Index1" IS NULL
;
COMMENT ON INDEX "Index2" IS NULL
;

-- Add keys for table report

ALTER TABLE "report" ADD CONSTRAINT "rep_key" PRIMARY KEY ("id")
;
COMMENT ON CONSTRAINT "rep_key" ON "report" IS NULL
;

-- Table teaches

CREATE TABLE "teaches"(
 "cid" Integer NOT NULL,
 "sid" Integer NOT NULL,
 "id" Integer NOT NULL
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "teaches" IS NULL
;
COMMENT ON COLUMN "teaches"."cid" IS NULL
;
COMMENT ON COLUMN "teaches"."sid" IS NULL
;
COMMENT ON COLUMN "teaches"."id" IS NULL
;

-- Add keys for table teaches

ALTER TABLE "teaches" ADD CONSTRAINT "Key6" PRIMARY KEY ("cid","sid","id")
;
COMMENT ON CONSTRAINT "Key6" ON "teaches" IS NULL
;

-- Create relationships section ------------------------------------------------- 

CREATE INDEX "IX_Relationship5_attends" ON "attends" ("cid")
;
ALTER TABLE "attends" ADD CONSTRAINT "Relationship5" FOREIGN KEY ("cid") REFERENCES "course" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

COMMENT ON CONSTRAINT "Relationship5" ON "attends" IS NULL
;

CREATE INDEX "IX_Relationship6_attends" ON "attends" ("sid")
;
ALTER TABLE "attends" ADD CONSTRAINT "Relationship6" FOREIGN KEY ("sid") REFERENCES "student" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

COMMENT ON CONSTRAINT "Relationship6" ON "attends" IS NULL
;

CREATE INDEX "IX_Relationship8_report" ON "report" ("pid")
;
ALTER TABLE "report" ADD CONSTRAINT "Relationship8" FOREIGN KEY ("pid") REFERENCES "professor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

COMMENT ON CONSTRAINT "Relationship8" ON "report" IS NULL
;

CREATE INDEX "IX_Relationship9_teaches" ON "teaches" ("cid", "sid")
;
ALTER TABLE "teaches" ADD CONSTRAINT "Relationship9" FOREIGN KEY ("cid", "sid") REFERENCES "attends" ("cid", "sid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

COMMENT ON CONSTRAINT "Relationship9" ON "teaches" IS NULL
;

CREATE INDEX "IX_Relationship10_teaches" ON "teaches" ("id")
;
ALTER TABLE "teaches" ADD CONSTRAINT "Relationship10" FOREIGN KEY ("id") REFERENCES "professor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

COMMENT ON CONSTRAINT "Relationship10" ON "teaches" IS NULL
;





