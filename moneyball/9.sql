SELECT
	teams.name,ROUND(AVG(salaries.salary),2) "average salary"
FROM
	salaries
JOIN teams ON
	teams.id=salaries.team_id
WHERE salaries.year=2001
GROUP BY
	salaries.team_id
ORDER BY
	"average salary" ASC
LIMIT 5;
