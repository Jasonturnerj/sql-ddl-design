DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
);

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL,
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  pass_first_name TEXT REFERENCES passengers(first_name) ON DELETE CASCADE,
  pass_last_name TEXT REFERENCES passengers(last_name) ON DELETE CASCADE,
  pass_seat TEXT UNIQUE REFERENCES passengers(seat) ON DELETE CASCADE,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL REFERENCES destinations(city) ON DELETE CASCADE,
  from_country TEXT NOT NULL REFERENCES destinations(country) ON DELETE CASCADE,
  to_city TEXT NOT NULL REFERENCES destinations(city) ON DELETE CASCADE,
  to_country TEXT NOT NULL REFERENCES destinations(city) ON DELETE CASCADE,
);

INSERT INTO passengers 
  (first_name, last_name, seat)
VALUES
  ('Jennifer', 'Finch', '33B'),
  ('Thadeus', 'Gathercoal', '8A'),
  ('Sonja', 'Pauley', '12F'),
  ('Jennifer', 'Finch', '20A'),
  ('Waneta', 'Skeleton', '23D'),
  ('Thadeus', 'Gathercoal', '18C'),
  ('Berkie', 'Wycliff', '9E'),
  ('Alvin', 'Leathes', '1A'),
  ('Berkie', 'Wycliff', '32B'),
  ('Cory', 'Squibbes', '10D');

INSERT INTO destinations
  (city, country,) 
VALUES
  ('Washington DC', 'United States'), ('Seattle', 'United States'),
  ('British Airways', 'Tokyo'), 'Japan', ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'), ('Las Vegas', 'United States'),
  ('Seattle', 'United States'), ('Mexico City', 'Mexico'),
  ('Paris', 'France'), ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'), ('Beijing', 'China'),
  ('New York', 'United States'), ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'), ('Chicago', 'United States'),
  ('Charlotte', 'United States'), ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'), ('Santiago', 'Chile');
    
  

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');