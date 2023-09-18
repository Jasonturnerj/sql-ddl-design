DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES matches ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    current_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    location TEXT NOT NULL,
    mdate DATE NOT NULL,
    start_time INTEGER NOT NULL
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    head_ref_id INTEGER REFERENCES referees ON DELETE CASCADE,
    assist_ref1_id INTEGER REFERENCES referees ON DELETE CASCADE,
    assist_ref2_id INTEGER REFERENCES referees ON DELETE CASCADE,
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);
