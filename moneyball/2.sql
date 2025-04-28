-- SELECT
--    salaries.year, salaries.salary
-- FROM
-- 	salaries
-- JOIN players ON
-- players.id=salaries.player_id
-- WHERE players.first_name='Cal'
-- and players.last_name='Ripken'
-- ORDER BY salaries.year DESC
------------------------------------------------
-- SELECT
--    salaries.year, salaries.salary
-- FROM
-- 	salaries
-- WHERE salaries.player_id =
-- (
-- SELECT
--     players.id
-- FROM
--     players
-- WHERE
--     players.first_name='Cal'
-- AND players.last_name='Ripken'
-- )
-- ORDER BY salaries.year DESC
---------------------------------------------
WITH player_id_cte AS (
   SELECT id
   FROM players
   WHERE first_name = 'Cal'
   AND last_name = 'Ripken'
)
SELECT
   salaries.year, salaries.salary
FROM
   salaries
JOIN player_id_cte
   ON salaries.player_id = player_id_cte.id
ORDER BY salaries.year DESC;
