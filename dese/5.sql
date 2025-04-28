
SELECT schools.city ,COUNT(*) AS number
FROM
  schools
WHERE
   schools.type ='Public School'
GROUP BY
    schools.city
HAVING
	number<=3
ORDER BY number DESC , schools.city;
