DROP DATABASE IF EXISTS sql_cities;

-- Create the database
CREATE DATABASE sql_cities;

-- Use the database

USE sql_cities;

/***************************
Creating the first table
***************************/

-- Create a table for general info about cities, table g.
CREATE TABLE cities_general (
	City_ID INT AUTO_INCREMENT, -- Automatically generated ID for each city
    `name` VARCHAR(255) NOT NULL, -- Name of the city gained by webscraping on Wikipedia
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    country VARCHAR(255) NOT NULL,
    population INT,
    region VARCHAR(255),
    is_capital VARCHAR(255),
    PRIMARY KEY (City_ID) -- Primary key to uniquely identify each city
);

select * from cities_general;

-- Create the 'cities' table containing all weather data, table aw.
CREATE TABLE cities_all_weather_data (    
    
    City_ID INT, -- City's ID
    City VARCHAR(255) NOT NULL, -- Name of the city gained by webscraping on Wikipedia
    Country VARCHAR(255) NOT NULL, -- Country of the city gained by webscraping on Wikipedia
    DTG DATETIME NOT NULL, -- Datetime of when data was retreived
    Temp_C DECIMAL(5,2)  NOT NULL, -- Temperature obtained by API
    Feels_Like_C DECIMAL(5,2)  NOT NULL, -- Fells like Temperature obtained by API
    Humid_pct INT  NOT NULL, -- Humidity obtained by API
    Outlook VARCHAR(255)  NOT NULL,-- Outlook obtained by API
    Wind_Speed_ms DECIMAL(6,2)  NOT NULL,-- Wind speed obtained by API
    
    FOREIGN KEY (`City_ID`) REFERENCES cities_general(City_ID)
);

select * from cities_all_weather_data;

SELECT 
    g.City_ID,
    g.name,
    g.country,
    aw.DTG,
    aw.Temp_C,
    aw.Humid_pct,
    aw.Outlook,
    aw.Wind_Speed_ms
FROM
    cities_general g
        JOIN
    cities_all_weather_data aw ON g.name = aw.City;
    
    
    -- Create the 'cities' table containing all flight data for the requested timeframe
CREATE TABLE cities_flight_data (
    flight_number VARCHAR(20),
    airline_cs VARCHAR(100),
    scheduled_time_utc DATETIME,
    `status` VARCHAR(30)
);

select * from cities_flight_data;
