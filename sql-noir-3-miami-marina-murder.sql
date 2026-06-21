-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

 Case #003: The Miami Marina Murder — Full Solution
  — Get the crime scene report
SELECT description FROM crime_scene
WHERE location = 'Coral Bay Marina' AND date = 19860814;

Clues from the report:

One witness saw someone who lives on "300ish Ocean Drive"
Another saw someone whose first name ends in "ul" and last name ends in "ez"

Find the two witnesses/persons of interest
SELECT * FROM person WHERE address LIKE '%Ocean Drive';

Returns: Carlos Mendez — 369 Ocean Drive (person ID: 101)

SELECT * FROM person WHERE name LIKE '%ul %' AND name LIKE '%ez';

Returns: Raul Gutierrez — 45 Sunset Ave (person ID: 102)

Get their interview transcripts
SELECT * FROM interviews WHERE person_id IN (101, 102);


Carlos Mendez: "I saw someone check into a hotel on August 13. The guy looked nervous."
Raul Gutierrez: "I heard someone checked into a hotel with 'Sunset' in the name."


-— Find the hotel check-in
SELECT surveillance_records.person_id, surveillance_records.suspicious_activity
FROM hotel_checkins
JOIN surveillance_records ON hotel_checkins.id = surveillance_records.hotel_checkin_id
WHERE check_in_date = 19860813
  AND hotel_name LIKE '%Sunset%'
  AND suspicious_activity IS NOT NULL;

Returns: Person ID 8 — "Left suddenly at 3 AM"

Get their confession
SELECT confession FROM confessions WHERE person_id = 8;

"Alright! I did it. I was paid to make sure he never left the marina alive."


— -Get their name
SELECT name FROM person WHERE id = 8;
The culprit : Thomas Brown
