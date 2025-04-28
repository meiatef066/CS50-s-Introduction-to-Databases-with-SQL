SELECT schools.name
FROM schools
JOIN districts on schools.district_id=districts.id
AND districts.name='Cambridge'
