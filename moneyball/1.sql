SELECT
	salaries.year,round(AVG(salaries.salary),2)
FROM
	salaries
GROUP BY
	salaries.year
ORDER BY
	salaries.year DESC
