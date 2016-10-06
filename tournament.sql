-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- DATABASE --

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament;


-- TABLES --

CREATE TABLE players (
	id serial primary key,
	name text
);

CREATE TABLE matches (
	id serial primary key,
	winner integer references players(id),
	loser integer references players(id)
);


-- VIEWS --

CREATE VIEW count_players AS 
	SELECT count(*) FROM players;

CREATE VIEW count_wins AS 
	SELECT players.id, players.name, count(matches.winner) AS wins 
	FROM players LEFT JOIN matches ON players.id = matches.winner
	GROUP BY players.name, players.id
	ORDER BY wins DESC;

CREATE VIEW count_losses AS
	SELECT players.id, players.name, count(matches.loser) AS losses 
	FROM players LEFT JOIN matches ON players.id = matches.loser
	GROUP BY players.name, players.id
	ORDER BY losses DESC;

CREATE VIEW standings AS
	SELECT count_wins.id, count_wins.name, wins, (wins + losses) as matches
	FROM count_wins JOIN count_losses ON count_wins.id = count_losses.id
	ORDER BY wins DESC;



