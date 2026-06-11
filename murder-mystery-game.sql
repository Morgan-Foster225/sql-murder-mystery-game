-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report
SELECT * FROM crime_scene_report;

-- Ran to see the tables of infomation 
SELECT name 
  FROM sqlite_master
 where type = 'table'

 -- Ran to see the crime sceane report 
 SELECT sql 
  FROM sqlite_master
 where name = 'crime_scene_report'

 -- Start with the crime scene report

-- We know:

type = murder
date = 20180115
city = SQL City
SELECT *
FROM crime_scene_report
WHERE type = 'murder'
  AND date = 20180115
  AND city = 'SQL City';


-- A description mentioning:

-- The murder happened in a parking lot
-- Witnesses exist:
-- One lives at the last house on Northwestern Dr
-- One is named Annabel and lives somewhere in the city
--  Identify Witness #1 (Northwestern Dr)

-- need the person living at the highest address on that street.

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;


-- Morty Schapiro
-- Check Morty’s interview

SELECT *
FROM interview
WHERE person_id = (
  SELECT id
  FROM person
  WHERE name = 'Morty Schapiro'
);

-- Key clue from Morty:

-- He saw:

-- A Get Fit Now Gym bag
-- Membership starts with 48Z
-- Membership is gold
-- Person checked in on Jan 9

-- Identify Witness #2 (Annabel)
SELECT *
FROM person
WHERE name LIKE 'Annabel%';
Result:
Annabel Miller

--Checked  Annabel’s interview
SELECT *
FROM interview
WHERE person_id = (
  SELECT id
  FROM person
  WHERE name = 'Annabel Miller'
);

--Key clue from Annabel:
--She saw the murderer at the gym on Jan 9
--The murderer is a regular gym member
-- Find matching gym check-ins

--filter gym data:

SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109;

--Then match with membership info:

SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'
  AND membership_status = 'gold';
Result:

--narrowed it down to:

48Z7A → Jeremy Bowers

-- Confirm with license + car + witness description

--Now verify Jeremy:

SELECT *
FROM person
WHERE name = 'Jeremy Bowers';

Then check his license:

SELECT *
FROM drivers_license
WHERE id = (
  SELECT license_id
  FROM person
  WHERE name = 'Jeremy Bowers'
);


--Matches witness description (vehicle, appearance, etc.)
-- Final answer

--The killer is:
 --Jeremy Bowers
-- Submit solution
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;
