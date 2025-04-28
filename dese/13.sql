SELECT districts.name, staff_evaluations.proficient
FROM staff_evaluations
JOIN districts ON
   districts.id=staff_evaluations.district_id
ORDER BY
staff_evaluations.proficient DESC
LIMIT 5;
