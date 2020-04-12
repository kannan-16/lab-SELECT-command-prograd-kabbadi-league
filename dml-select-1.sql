## Progression


-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**
INSERT INTO TEAM VALUES (1, 'RAJASTHAN', 'SACHIN TANWAR',21,33);
INSERT INTO TEAM VALUES (2, 'TAMILNADU', 'UDAYA KUMAR',22,45);
INSERT INTO TEAM VALUES (3, 'DELHI', 'KRISHNA KUMAR',23,67);
INSERT INTO TEAM VALUES (4, 'IRAN', 'BRO',24,89);

SELECT * FROM TEAM

SELECT * FROM TEAM ORDER BY NAME;

-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**
INSERT INTO PLAYER VALUES (1,'DEEPAK','INDIA',1,21);
INSERT INTO PLAYER VALUES (2,'AJAY','INDIA',2,23);
INSERT INTO PLAYER VALUES (3,'RAHUL','INDIA',3,27);
INSERT INTO PLAYER VALUES (4,'SANJAY','INDIA',4,33);
INSERT INTO PLAYER VALUES (5,'AUSTIN','AUSTRALIA',4,89);

SELECT * FROM PLAYER

SELECT * FROM PLAYER WHERE NAME LIKE 'S%' AND COUNTRY != 'south africe' ORDER BY NAME DESC;

-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**

SELECT EVENT_NO,CLOCK_IN_SECONDS FROM EVENT ORDER BY EVENT_NO;
-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**
INSERT INTO EVENT VALUES(6,1,21,7,1,4,12,36,31);
INSERT INTO EVENT VALUES(7,2,23,4,1,1,2,3,14);

SELECT * FROM EVENT

SELECT EVENT_NO FROM EVENT WHERE RAID_POINTS+DEFENDING_POINTS >=3 ORDER BY EVENT_NO;
-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE COUNTRY='INDIA' OR COUNTRY = 'IRAN' ORDER BY NAME;

-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE COUNTRY NOT IN ('INDIA','IRAN');

-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**
INSERT INTO SKILL2 VALUES (1, 'CURVE KICK');
INSERT INTO SKILL2 VALUES (2, 'DEFEND KICK');
INSERT INTO SKILL2 VALUES (3, 'THIGH HOLD');

SELECT NAME FROM SKILL2 WHERE NAME LIKE 'DEFEND%' ORDER BY NAME;

-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**
INSERT INTO VENUE VALUES (1, 'Netaji Indoor Stadium', 52);
INSERT INTO VENUE VALUES (2, 'Sree Kanteerava Stadium', 63);
INSERT INTO VENUE VALUES (3, 'Patliputra Sports Complex', 44);

SELECT STADIUM_NAME FROM VENUE WHERE STADIUM_NAME LIKE '%Complex' ORDER BY STADIUM_NAME;

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**
INSERT INTO GAME VALUES(1,TO_DATE('23/10/2019', 'DD/MM/YYYY'),1,2,52,9,1,2,33,7);
INSERT INTO GAME VALUES(2,TO_DATE('12/04/2020', 'DD/MM/YYYY'),2,3,63,9,1,2,33,7);
INSERT INTO GAME VALUES(3,TO_DATE('03/02/2020', 'DD/MM/YYYY'),4,5,21,9,1,2,33,7);
INSERT INTO GAME VALUES(4,TO_DATE('26/01/2020', 'DD/MM/YYYY'),8,9,21,9,1,2,33,7);

SELECT * FROM GAME WHERE GAME_DATE BETWEEN '31-JAN-2020' AND '31-MAR-2020' ORDER BY ID DESC;

-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**
SELECT NAME FROM PLAYER WHERE ID IN (SELECT RAIDER_ID FROM EVENT) ORDER BY NAME;

-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**
SELECT EVENT_NO,RAID_POINTS,DEFENDING_POINTS FROM EVENT WHERE INNINGS_ID IN (SELECT FIRST_INNINGS_ID FROM GAME WHERE GAME_DATE='26-JAN-2020') ORDER BY EVENT_NO;

-- 12. **Write a query to display the event number, raid points and defence points scored in the first innings of the game that was played on `2020-01-26`. Display the records sorted in ascending order based on event number.**
SELECT * FROM TEAM WHERE ID IN (SELECT WINNER_TEAM_ID FROM OUTCOME WHERE ID IN (SELECT OUTCOME_ID FROM GAME WHERE GAME_DATE='09-MAR-2020')) ORDER BY NAME;

-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**
SELECT NAME FROM PLAYER WHERE ID IN(SELECT PLAYER_OF_MATCH FROM OUTCOME WHERE ID IN(SELECT OUTCOME_ID FROM GAME WHERE GAME_DATE='09-MAR-2020')) ORDER BY NAME;

-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE SKILL_ID IN (SELECT ID FROM SKILL2 WHERE NAME='ALL ROUNDERS') ORDER BY NAME;

-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**
SELECT name FROM player WHERE skill_id=3 ORDER BY name ASC;

-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**
SELECT STADIUM_NAME FROM GAME,VENUE WHERE GAME_DATE = TO_DATE('09-MAR-2020', 'DD-MM-YYYY') ORDER BY VENUE_ID ASC;

-- 17. **Write a query to display the Coach's name of the team `Iran`**
SELECT COACH FROM TEAM WHERE NAME='IRAN';

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**
INSERT INTO PLAYER VALUES(7,'Fazel Atrachali','IRAN',21,44);

SELECT EVENT_NO FROM EVENT WHERE RAIDER_ID IN (SELECT ID FROM PLAYER WHERE NAME = 'FAZEL ATRACHALI') ORDER BY EVENT_NO;

-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**

-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**
