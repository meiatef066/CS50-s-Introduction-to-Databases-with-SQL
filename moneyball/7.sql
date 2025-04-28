WITH playerId AS (
    SELECT salaries.player_id  AS id
    FROM salaries
    ORDER BY salaries.salary DESC
    LIMIT 1
)
SELECT players.first_name, players.last_name
FROM players
JOIN playerId ON playerId.id=players.id
