SELECT teams.name,sum(performances.H) as "total hits"
FROM performances
JOIN teams ON teams.id=performances.team_id
WHERE performances.year=2001
GROUP BY teams.id
ORDER BY "total hits" DESC
LIMIT 5;
