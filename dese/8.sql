SELECT districts.name ,sum(expenditures.pupils)
FROM districts
JOIN expenditures on expenditures.district_id=districts.id
GROUP BY districts.name
