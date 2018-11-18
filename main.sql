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
    latitude NUMERIC,
    longitude NUMERIC,
    magnitude NUMERIC
);

\COPY earthquake (date, latitude, longitude, magnitude) FROM '~/Dropbox/Clayton/2018~2019/CSCI403/CSCI403_Final_Project/Data/earthquake.csv' WITH (FORMAT csv);
