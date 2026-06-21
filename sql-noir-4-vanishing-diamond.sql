-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
 — Get the crime scene report
SELECT * FROM crime_scene
WHERE location = 'Fontainebleau Hotel';

Points to two witnesses: a famous actor, and a female consultant whose first name ends in "an".


 — Find the witnesses
SELECT w.id, name, occupation, clue FROM guest g
JOIN witness_statements w ON w.guest_id = g.id
WHERE occupation = 'Actor'
   OR (occupation = 'Consultant' AND name LIKE '%an %');

Their clues:

"I saw someone holding an invitation ending with '-R'. He was wearing a navy suit and a white tie."
"I overheard someone say, 'Meet me at the marina, dock 3'."



— Find the suspect using all three clues
SELECT * FROM marina_rentals m
JOIN guest g ON g.id = m.renter_guest_id
JOIN attire_registry a ON a.guest_id = g.id
WHERE dock_number = 3
  AND invitation_code LIKE '%-R'
  AND note = 'navy suit, white tie';

Returns: guest ID 105 — Mike Manning


 — Confirm with the confession
SELECT confession FROM final_interviews
WHERE guest_id = 105;

The culprit: Mike Manning