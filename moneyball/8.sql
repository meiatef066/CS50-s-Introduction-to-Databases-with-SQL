WITH max_hr AS (
    SELECT MAX(HR) AS HR
    FROM performances
),
player_HR AS (
    SELECT performances.player_id AS id
    FROM performances
    WHERE performances.HR = (SELECT HR FROM max_hr)
)
SELECT salaries.salary
FROM salaries
JOIN player_HR ON player_HR.id = salaries.player_id
WHERE salaries.year = 2001
ORDER BY salaries.salary DESC
LIMIT 1;
