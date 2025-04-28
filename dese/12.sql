

SELECT
	districts.name,expenditures.per_pupil_expenditure,staff_evaluations.exemplary
FROM
 	districts
JOIN
	staff_evaluations on staff_evaluations.district_id=districts.id

    AND
    staff_evaluations.exemplary>(SELECT AVG(staff_evaluations.exemplary) FROM staff_evaluations)
JOIN
	expenditures ON expenditures.district_id=districts.id
	AND
    expenditures.per_pupil_expenditure>(SELECT AVG(expenditures.per_pupil_expenditure) FROM expenditures)
where districts.id in (
	     SELECT DISTINCT("district_id") FROM "schools"
        WHERE "type" = 'Public School'
)
ORDER BY
  	staff_evaluations.exemplary DESC ,
    expenditures.per_pupil_expenditure DESC
