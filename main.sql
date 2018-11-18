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
    magnitude NUMERIC,
    PRIMARY KEY (date, latitude, longitude, magnitude)
);

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
    intensity NUMERIC,
    PRIMARY KEY (year, month, date, magnitude, latitude, longitude, intensity)
);

CREATE TABLE tsunami_raw (
    SOURCE_ID NUMERIC,
    YEAR NUMERIC,
    MONTH NUMERIC,
    DAY NUMERIC,
    HOUR NUMERIC,
    MINUTE NUMERIC,
    CAUSE NUMERIC,
    VALIDITY NUMERIC,
    FOCAL_DEPTH NUMERIC,
    PRIMARY_MAGNITUDE NUMERIC,
    REGION_CODE NUMERIC,
    COUNTRY TEXT,
    STATE_PROVINCE TEXT,
    LOCATION TEXT,
    LATITUDE NUMERIC,
    LONGITUDE NUMERIC,
    MAXIMUM_HEIGHT NUMERIC,
    MAGNITUDE_ABE NUMERIC,
    MAGNITUDE_IIDA NUMERIC,
    INTENSITY_SOLOVIEV NUMERIC,
    WARNING_STATUS NUMERIC,
    MISSING NUMERIC,
    MISSING_ESTIMATE NUMERIC,
    INJURIES NUMERIC,
    INJURY_ESTIMATE NUMERIC,
    FATALITIES NUMERIC,
    FATALITY_ESTIMATE NUMERIC,
    DAMAGE_MILLIONS_DOLLARS NUMERIC,
    DAMAGE_ESTIMATE NUMERIC,
    HOUSES_DAMAGED NUMERIC,
    HOUSE_DAMAGE_ESTIMATE NUMERIC,
    HOUSES_DESTROYED NUMERIC,
    HOUSE_DESTRUCTION_ESTIMATE NUMERIC,
    ALL_MISSING NUMERIC,
    MISSING_TOTAL NUMERIC,
    ALL_INJURIES NUMERIC,
    INJURY_TOTAL NUMERIC,
    ALL_FATALITIES NUMERIC,
    FATALITY_TOTAL NUMERIC,
    ALL_DAMAGE_MILLIONS NUMERIC,
    DAMAGE_TOTAL NUMERIC,
    ALL_HOUSES_DAMAGED NUMERIC,
    HOUSE_DAMAGE_TOTAL NUMERIC,
    ALL_HOUSES_DESTROYED NUMERIC,
    HOUSE_DESTRUCTION_TOTAL NUMERIC
);

\COPY tsunami_raw FROM '../../CSCI403_Final_Project/Data/sources.csv' DELIMITER ',' CSV;

CREATE TABLE volcano (
    year NUMERIC,
    month NUMERIC,
    day NUMERIC,
    country TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    vei INTEGER,
    PRIMARY KEY (year, month, day, latitude, longitude)
);


CREATE TABLE volcano_raw (
    year NUMERIC,
    month NUMERIC,
    day NUMERIC,
    tsu TEXT,
    eq TEXT,
    name TEXT,
    location TEXT,
    country TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    elevation NUMERIC,
    typeOf TEXT,
    status TEXT,
    time TEXT,
    vei INTEGER,
    agent TEXT,
    deaths INTEGER,
    deathDesc INTEGER,
    missing INTEGER,
    missingDesc INTEGER,
    injuries INTEGER,
    injuriesDesc INTEGER,
    damage_mil NUMERIC,
    damageDesc INTEGER,
    houseDest INTEGER,
    HouseDestDesc INTEGER,
    totalDeath INTEGER,
    totalDeathDesc INTEGER,
    totalMissing INTEGER,
    totalMissingDesc INTEGER,
    totalInjuries INTEGER,
    totalInjuriesDesc INTEGER,
    totalDamage_mil NUMERIC,
    totalDamage_milDesc INTEGER,
    totalHouseDest INTEGER,
    totalHouseDestDesc INTEGER
);

\COPY volcano_raw FROM '../../CSCI403_Final_Project/Data/volcano.csv' DELIMITER ',' CSV;
DELETE FROM volcano_raw WHERE day IS NULL OR year IS NULL OR month IS NULL;

INSERT INTO volcano SELECT year, month, day, country, latitude, longitude, vei FROM volcano_raw;
UPDATE volcano SET vei = 1 WHERE vei IS NULL;
