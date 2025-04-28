SELECT districts.name ,expenditures.per_pupil_expenditure
FROM districts
JOIN expenditures on expenditures.district_id=districts.id
AND districts.type='Public School District'

ORDER BY expenditures.per_pupil_expenditure DESC
LIMIT 10;
