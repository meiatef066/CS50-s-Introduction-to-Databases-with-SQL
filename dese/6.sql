SELECT schools.name
 FROM schools
JOIN graduation_rates on schools.id=graduation_rates.school_id
AND graduation_rates.graduated=100
