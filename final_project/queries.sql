-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Get player stats for John Smith
SELECT *
FROM player_stats
INNER JOIN players ON player_stats.player_id = players.id
WHERE players.first_name = 'John' AND players.last_name = 'Smith'

-- Get total points for Duke in 2020 season
SELECT SUM(points) AS total_points
FROM team_stats
INNER JOIN teams ON team_stats.team_id = teams.id
INNER JOIN seasons ON team_stats.season_id = seasons.id
WHERE teams.name = 'Duke' AND seasons.year = 2020

-- Get players from Big 10 conference schools
SELECT players.*
FROM players
INNER JOIN schools ON players.school_id = schools.id
INNER JOIN teams ON schools.team_id = teams.id
INNER JOIN conferences ON teams.conference_id = conferences.id
WHERE conferences.name = 'Big 10'

-- Top 5 scoring teams in the 2020 season
SELECT teams.name, SUM(team_stats.points) AS total_points
FROM team_stats
INNER JOIN teams ON team_stats.team_id = teams.id
INNER JOIN seasons ON team_stats.season_id = seasons.id
WHERE seasons.year = 2020
GROUP BY teams.name
ORDER BY total_points DESC
LIMIT 5;
