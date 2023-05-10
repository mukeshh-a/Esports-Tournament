-- 1. What are the names of the players whose salary is greater than 100,000?

SELECT player_name AS [Player Name]
FROM Players
WHERE salary > 100000;


-- 2. What is the team name of the player with player_id = 3?

SELECT team_name AS [Team Name]
FROM Teams t
JOIN Players p ON t.team_id = p.team_id
WHERE player_id = 3;


-- 3. What is the total number of players in each team?

SELECT t.team_name AS [Team Name], COUNT(player_id) AS [Total Player]
FROM Players p 
JOIN Teams t on t.team_id = p.team_id
GROUP BY t.team_name
ORDER BY [Total Player]


-- 4. What is the team name and captain name of the team with team_id = 2?

SELECT t.team_name AS [Team Name], p.player_name AS [Captain Name]
FROM Teams t
JOIN Players p ON t.captain_id = p.player_id
WHERE t.team_id = 2;


-- 5. What are the player names and their roles in the team with team_id = 1?

SELECT p.player_name AS [Player Name], p.role AS [Role]
FROM Teams t
JOIN Players p ON t.team_id = p.team_id
WHERE t.team_id = 1; 


-- 6. What are the team names and the number of matches they have won?

SELECT t.team_name AS [Team Name], COUNT(m.winner_id) AS [Matches Won]
FROM Matches m 
JOIN Teams t ON m.winner_id = t.team_id
GROUP BY t.team_name
ORDER by COUNT(m.winner_id);


-- 7. What is the average salary of players in the teams with country 'USA'?

SELECT AVG(salary) AS [Average Salary]
FROM Players p
JOIN Teams t ON p.team_id = t.team_id
WHERE country = 'USA';


-- 8. Which team won the most matches?

SELECT TOP 1 t.team_name AS [Team Name], COUNT(m.winner_id) AS [Matches Won]
FROM Matches m 
JOIN Teams t ON m.winner_id = t.team_id
GROUP BY t.team_name
ORDER by COUNT(m.winner_id) DESC;


-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?

SELECT t.team_name AS [Team Name], COUNT(p.player_id) AS [Player Count]
FROM Teams t
JOIN Players p ON t.team_id = p.team_id
WHERE salary > 100000
GROUP BY t.team_name
ORDER BY COUNT(p.player_id);


-- 10. What is the date and the score of the match with match_id = 3?

SELECT match_date AS [Date], score_team1 + score_team2 AS [Match Score]
FROM Matches
WHERE match_id = 3;