/* CSCI 403 Final Project
* Alex DeGroat
* Clayton Kramp
* Jeffrey Stenerson
* Allee Zarrini
*/

DROP TABLE IF EXISTS tsunami CASCADE;
DROP TABLE IF EXISTS volcano CASCADE;
DROP TABLE IF EXISTS earthquake CASCADE;

CREATE TABLE earthquake (
    date DATE,
    latitude NUMERIC(7,3),
    longitude NUMERIC(7,3),
    magnitude NUMERIC
);

\COPY earthquake (date, latitude, longitude, magnitude) FROM '~/Dropbox/Clayton/2018~2019/CSCI403/CSCI403_Final_Project/Data/earthquake-min.csv' DELIMITER ',' CSV;

CREATE TABLE tsunami (
    year NUMERIC,
    month NUMERIC,
    date NUMERIC,
    magnitude NUMERIC,
    country TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    intensity NUMERIC
);

\COPY tsunami FROM '~/Dropbox/Clayton/2018~2019/CSCI403/CSCI403_Final_Project/Data/tsunami-min.csv' DELIMITER ',' CSV;

CREATE TABLE volcano (
    year NUMERIC,
    month NUMERIC,
    day NUMERIC,
    country TEXT,
    latitude NUMERIC,
    longitude NUMERIC
);

\COPY volcano FROM '~/Dropbox/Clayton/2018~2019/CSCI403/CSCI403_Final_Project/Data/volcano-min.csv' DELIMITER ',' CSV;
