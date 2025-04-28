.import --csv meteorites.csv meteorites_temp

--> Set empty values to NULL
UPDATE "meteorites_temp"
SET mass=NULL
WHERE
mass=''or
mass=NULL;

UPDATE "meteorites_temp"
SET year=NULL
WHERE
year='' or year=NULL;

UPDATE "meteorites_temp"
SET lat=NULL
WHERE lat=''or lat=NULL
;
UPDATE "meteorites_temp"
SET long=NULL
WHERE long =''or long=NULL
;
-------------------------------
--> Round certain columns to two decimal places
UPDATE "meteorites_temp"
SET mass=Round(mass,2),
lat=Round(lat,2),
long=Round(lat,2)
;
------------------------------
--> Delete rows with nametype 'Relict'
DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';
---------------------------------
--> Create the 'meteorites' table with new_order column
CREATE TABLE "meteorites" AS
SELECT ROW_NUMBER()
OVER (ORDER by year,name)as
     id ,
	"name",
	"class",
	"mass",
	"discovery",
	"year",
	"lat",
	"long"
    FROM "meteorites_temp"
    ;
DROP TABLE "meteorites_temp"

