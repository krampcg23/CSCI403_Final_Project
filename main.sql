/* CSCI 403 Final Project
* Alex DeGroat
* Clayton Kramp
* Jeffrey Stenerson
* Allee Zarrini
*/

DROP TABLE IF EXISTS tsunami CASCADE;
DROP TABLE IF EXISTS tsunami_raw CASCADE;
DROP TABLE IF EXISTS volcano CASCADE;
DROP TABLE IF EXISTS volcano_raw CASCADE;
DROP TABLE IF EXISTS earthquake CASCADE;
DROP TABLE IF EXISTS earthquake_raw CASCADE;

CREATE TABLE earthquake (
    date DATE,
    latitude NUMERIC(7,3),
    longitude NUMERIC(7,3),
    magnitude NUMERIC
);

-- \COPY earthquake (date, latitude, longitude, magnitude) FROM '../../CSCI403_Final_Project/Data/earthquake-min.csv' DELIMITER ',' CSV;

CREATE TABLE earthquake_raw (
    date DATE,
    time TEXT,
    latitude NUMERIC(7,3),
    longitude NUMERIC(7,3),
    type TEXT,
    depth NUMERIC,
    depth_error NUMERIC,
    depth_seismic NUMERIC,
    magnitude NUMERIC NOT NULL,
    magnitude_type TEXT,
    magnitude_error NUMERIC,
    magnitude_seismic NUMERIC,
    azimuthal_gap NUMERIC,
    horizontal_distance NUMERIC,
    horizontal_error NUMERIC,
    root_mean_square NUMERIC, 
    ID TEXT,
    source TEXT,
    location TEXT,
    magnitude_source TEXT,
    status TEXT
);

\COPY earthquake_raw FROM '../../CSCI403_Final_Project/Data/earthquake.csv' DELIMITER ',' CSV;

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

\COPY tsunami FROM '../../CSCI403_Final_Project/Data/tsunami-min.csv' DELIMITER ',' CSV;

CREATE TABLE volcano (
    year NUMERIC,
    month NUMERIC,
    day NUMERIC,
    country TEXT,
    latitude NUMERIC,
    longitude NUMERIC
);

\COPY volcano FROM '../../CSCI403_Final_Project/Data/volcano-min.csv' DELIMITER ',' CSV;
