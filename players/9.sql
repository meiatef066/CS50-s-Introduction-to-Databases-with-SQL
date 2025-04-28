SELECT
	"first_name",
	"last_name"
FROM
	"players"
where "final_game" between '2022-01-01' and '2022-12-31'
order by "first_name","last_name" asc
