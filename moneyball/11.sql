SELECT
     players.first_name,
     players.last_name,
     NULLIF(salaries.salary/performances.H,0) "dollars per hit"
FROM
	players
JOIN performances ON
	performances.player_id=players.id
JOIN salaries ON
	salaries.player_id=players.id
WHERE
	performances.H <> 0
AND
 	performances.year=salaries.year
AND
	performances.year=2001

ORDER BY
 	"dollars per hit" ASC,
 	players.first_name,
    players.last_name

LIMIT 10;
