WITH run_home_player AS (
    SELECT players.id
    FROM players
    WHERE
        players.first_name = 'Ken'
        AND players.last_name = 'Griffey'
        AND players.birth_year = 1969
)
SELECT
    performances.year,
    performances.HR
FROM
    performances
JOIN run_home_player ON performances.player_id = run_home_player.id
ORDER BY performances.year DESC;
