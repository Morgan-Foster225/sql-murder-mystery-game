-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


SELECT * FROM crime_scene;
SELECT * FROM suspects;
SELECT * FROM interviews;

-- 1. Crime Scene Clue

-- The Blue Note Lounge record (ID 76) states:

-- "A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene."

-- Key identifying features:

-- Trench coat
-- Scar on left cheek
-- 2. Match the Suspect

-- Looking through the suspect list, two suspects wear a trench coat:

-- ID	Name	Attire	Scar
-- 3	Frankie Lombardi	trench coat	left cheek
-- 183	Vincent Malone	trench coat	left cheek

-- Both match the witness description.

-- 3. Verify with Interview Transcript

-- Checking the interviews:

-- Suspect 3 (Frankie Lombardi): Transcript is NULL (no statement).
-- Suspect 183 (Vincent Malone): Transcript says:

-- "I wasn't going to steal it, but I did."

-- This is effectively a confession.

-- Culprit

-- Vincent Malone

-- Reasoning:

-- Matches the witness description exactly (trench coat + scar on left cheek).

-- Interview transcript contains a direct admission:

-- "I wasn't going to steal it, but I did."