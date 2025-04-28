SELECT districts.name
FROM districts
JOIN expenditures on expenditures.district_id=districts.id
GROUP BY districts.name
ORDER BY expenditures.pupils
limit 1;
