-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


--Find the relevant crime scene.

SELECT * FROM crime_scene;

SELECT id, description FROM crime_scene
WHERE location = 'West Hollywood Records';

SELECT clue FROM witnesses
JOIN crime_scene ON witnesses.crime_scene_id = crime_scene.id
WHERE location = 'West Hollywood Records';

Clues:

"I saw a man wearing a red bandana rushing out of the store."
"He had a distinctive gold watch on his wrist."


Find matching suspects
SELECT id, name FROM suspects
WHERE bandana_color = 'red' AND accessory = 'gold watch';

Returns: Tony Ramirez, Mickey Rivera, Rico Delgado

SELECT suspect_id, name, transcript FROM interviews
JOIN suspects ON interviews.suspect_id = suspects.id
WHERE bandana_color = 'red' AND accessory = 'gold watch'
AND transcript IS NOT NULL;


Tony Ramirez: "I wasn't anywhere near West Hollywood Records that night."
Mickey Rivera: "I was busy with my music career..."
Rico Delgado:

The culprit its Rico Delgado


