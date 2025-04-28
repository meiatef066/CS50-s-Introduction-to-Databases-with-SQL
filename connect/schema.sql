CREATE TABLE Users(
  User_id SERIAL PRIMARY KEY,
firstName varchar(20) not NULL,
  lastName varchar(20) not NULL,
  username varchar(20) not NULL UNIQUE,
  password varchar(20) not NULL
);
CREATE TABLE School(
 School_id SERIAL PRIMARY KEY,
name varchar(20) not NULL,
 type varchar(20)  ,
 location text,
 founded_year int
);
CREATE TABLE Companies(
  Companies_id SERIAL PRIMARY KEY,
  name varchar(20) not NULL,
  industry varchar(20) not NULL,
  location text NOT NULL
);
-----------------------------------------------------
CREATE TABLE peopleConnection(
id int serial PRIMARY KEY,
user_id REFERENCES User(User_id),
following_id REFERENCES User(User_id),
CONSTRAINT unique_connection UNIQUE (user_id,following_id)
);
CREATE TABLE schoolConnection(
id int serial PRIMARY KEY,
user_id REFERENCES User(User_id),
school_id REFERENCES School(School_id),
"start_date" DATE,
"end_date" DATE,
 "degree_type" TEXT,
 CONSTRAINT uniqueSchoolConnection UNIQUE(user_id,school_id)
);


CREATE TABLE "company_connections" (
    id INTEGER,
    user_id INTEGER,
    company_id INTEGER,
    start_date DATE,
    end_date DATE,
    title TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "Users"("User_id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("Companies_id"),
    CONSTRAINT unique_company_connection UNIQUE (user_id, company_id)
);





