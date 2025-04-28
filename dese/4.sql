SELECT schools.city ,COUNT("type") AS number
   FROM schools
WHERE schools.type ='Public School'
GROUP BY schools.city
ORDER BY number  DESC , schools.city ASC
limit 10;
