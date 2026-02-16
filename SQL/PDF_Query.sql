-- 1. DROP EXISTING TABLES
DROP TABLE IF EXISTS Bowling_StaƟsƟcs;
DROP TABLE IF EXISTS Baƫng_StaƟsƟcs;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Formats;
GO
-- 2. CREATE TABLES
CREATE TABLE Formats (
 format_id INT IDENTITY(1,1) PRIMARY KEY,
 format_name VARCHAR(20) NOT NULL UNIQUE,
 overs_per_innings INT,
 description VARCHAR(200)
);
GO
CREATE TABLE Players (
 player_id INT IDENTITY(1,1) PRIMARY KEY,
 player_name VARCHAR(100) NOT NULL,
 country VARCHAR(50) NOT NULL,
 date_of_birth DATE,
 role VARCHAR(50) NOT NULL,
 bating_style VARCHAR(50),
 bowling_style VARCHAR(50),
 debut_year INT,
 CONSTRAINT CHK_PlayerRole CHECK (role IN
 ('Batsman', 'Bowler', 'All-rounder', 'Wicket-keeper')
 )
);
GO
CREATE TABLE Bating_Statistics (
 bating_statistics_id INT IDENTITY(1,1) PRIMARY KEY,
 player_id INT NOT NULL,
 format_id INT NOT NULL,
 innings INT DEFAULT 0,
 runs_scored INT DEFAULT 0,
 centuries INT DEFAULT 0,
 bating_average DECIMAL(6, 2),
 strike_rate DECIMAL(6, 2),

 FOREIGN KEY (player_id) REFERENCES Players(player_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (format_id) REFERENCES Formats(format_id)
 ON DELETE NO ACTION ON UPDATE NO ACTION,

 UNIQUE(player_id, format_id)
);
GO 
CREATE TABLE Bowling_Statistics (
 bowling_statistics_id INT IDENTITY(1,1) PRIMARY KEY,
 player_id INT NOT NULL,
 format_id INT NOT NULL,
 matches_played INT DEFAULT 0,
 wickets_taken INT DEFAULT 0,
 best_bowling VARCHAR(10),
 five_wicket_hauls INT DEFAULT 0,
 economy_rate DECIMAL(5, 2),
 FOREIGN KEY (player_id) REFERENCES Players(player_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (format_id) REFERENCES Formats(format_id)
 ON DELETE NO ACTION ON UPDATE NO ACTION,
 UNIQUE(player_id, format_id)
);
GO 
-- 3. POPULATE DATA
INSERT INTO Formats (format_name, overs_per_innings, description) VALUES
('Test', NULL, 'MulƟ-day format with unlimited overs'),
('ODI', 50, 'One Day InternaƟonal - 50 overs per side'),
('T20', 20, 'Twenty20 - 20 overs per side'),
('T10', 10, 'Ten10 - 10 overs per side'),
('The Hundred', NULL, '100 balls per side format'),
('List A', 50, 'Limited overs domesƟc cricket'),
('First Class', NULL, 'MulƟ-day domesƟc cricket format');
GO
INSERT INTO Players (player_name, country, date_of_birth, role, bating_style, bowling_style, debut_year) VALUES
('Virat Kohli', 'India', '1988-11-05', 'Batsman', 'Right-hand bat', 'Right-arm medium', 2008),
('Jasprit Bumrah', 'India', '1993-12-06', 'Bowler', 'Right-hand bat', 'Right-arm fast', 2016),
('Steve Smith', 'Australia', '1989-06-02', 'Batsman', 'Right-hand bat', 'Leg break', 2010),
('Pat Cummins', 'Australia', '1993-05-08', 'All-rounder', 'Right-hand bat', 'Right-arm fast', 2011),
('Joe Root', 'England', '1990-12-30', 'Batsman', 'Right-hand bat', 'Right-arm off break', 2012),
('Shaheen Afridi', 'Pakistan', '2000-04-06', 'Bowler', 'LeŌ-hand bat', 'LeŌ-arm fast', 2018),
('Babar Azam', 'Pakistan', '1994-10-15', 'Batsman', 'Right-hand bat', 'Right-arm off break', 2015);
GO INSERT INTO Bating_Statistics (player_id, format_id, innings, runs_scored, centuries, bating_average, strike_rate) VALUES
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 196, 8848, 29, 47.55, 58.07),
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 283, 13906, 50, 59.18, 93.42),
((SELECT player_id FROM Players WHERE player_name = 'Steve Smith'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 196, 9685, 32, 56.97, 54.26),
((SELECT player_id FROM Players WHERE player_name = 'Joe Root'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 272, 12377, 34, 50.10, 51.82),
((SELECT player_id FROM Players WHERE player_name = 'Babar Azam'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 125, 5729, 19, 56.72, 89.23),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 89, 1747, 1, 29.78, 88.56),
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'T20'), 117, 4188, 1, 52.73, 138.43);
GO
INSERT INTO Bowling_Statistics (player_id, format_id, matches_played, wickets_taken, best_bowling, five_wicket_hauls,
economy_rate) VALUES
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 36, 159, '6/27', 11, 2.42),
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 89, 149, '6/19', 5, 5.08),
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'T20'), 70, 89, '3/7', 0, 7.36),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 60, 269, '6/23', 14, 2.56),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 95, 171, '5/70', 2, 5.17),
((SELECT player_id FROM Players WHERE player_name = 'Shaheen Afridi'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 31, 122, '6/51', 6, 2.71),
((SELECT player_id FROM Players WHERE player_name = 'Shaheen Afridi'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 57, 97, '6/35', 3, 5.73);
GO

--Queries
--1. Get bowling statistics of Pat Cummins in all formats

select bs.*
from Bowling_Statistics bs
join Players p
on bs.player_id = p.player_id
where p.player_name = 'Pat Cummins'

--2. Count how many players belong to each country

select 
	p.country,
	count(p.player_id) Total_player
from Players p
group by
	country

--3. Show top 5 highest strike rates in T20 format

select 
top 5
	p.player_name,
	bs.strike_rate
from Bating_Statistics bs
join Formats f
on bs.format_id = f.format_id
join Players p
on bs.player_id = p.player_id 
where f.format_name = 'T20'
order by strike_rate

--4. Show bowlers with economy < 3 in Test format

select 
	p.player_name,
	bs.economy_rate
from Bowling_Statistics bs
join Formats f
on bs.format_id = f.format_id
join Players p
on bs.player_id = p.player_id 
where 
	bs.economy_rate < 3 and
	f.format_name = 'Test'

--5. List players who play as All-rounders and have both >1000 runs and >50 wickets

select 
	distinct p.player_name

from Bowling_Statistics bos

join Players p
on bos.player_id = p.player_id 

join Bating_Statistics bas
on bas.player_id = p.player_id

where 
	p.role = 'All-rounder' and
	bas.runs_scored > 1000 and
	bos.wickets_taken > 50

--6. Show average bating strike rate for each format

select 
	f.format_name,
	avg(bas.strike_rate) Avg_Strike_rate
from Bating_Statistics bas
join Players p
on bas.player_id = p.player_id
join Formats f
on bas.format_id = f.format_id
group by
	f.format_name

--7. List top 3 bowlers with most 5-wicket hauls

select
top 3
	p.player_name,
	bos.five_wicket_hauls
from Players p
join Bowling_Statistics bos
on p.player_id = bos.player_id
order by bos.five_wicket_hauls desc

--8. Find the youngest player in the database

select
top 1
	p.player_name,
	max(p.date_of_birth) date_of_birth
from Players p
group by 
	p.player_name

--9. Show players who have never scored a century in any format

select 
	p.player_name
from Players p
join Bating_Statistics bas
on bas.player_id = p.player_id

right join Bowling_Statistics bos
on p.player_id = bos.player_id

join Formats f
on f.format_id = bas.format_id
where 
	f.format_name in ('T20','ODI','Test') 
group by
	p.player_name


--10. Display the player name who has the lowest bowling economy in ODI.

select 
top 1
	p.player_name,
	min(bos.economy_rate)
from Players p
join Bowling_Statistics bos
on p.player_id = bos.player_id

join Formats f
on f.format_id = bos.format_id

where 
	f.format_name = 'ODI'
group by 
	p.player_name

--11. Find players from India with their total runs across all formats

select 
	p.player_name,
	sum(bas.runs_scored) Total_runs
from Players p
join Bating_Statistics bas
on bas.player_id = p.player_id

join Formats f
on f.format_id = bas.format_id
where 
	p.country = 'India'
group by
	p.player_name

--12. Find the player who has scored the highest runs in ODI format (using subquery).

select 
	p.player_name,
	bas.runs_scored
from Players p
join Bating_Statistics bas
on p.player_id = bas.player_id
join Formats f
on f.format_id = bas.format_id
where 
	bas.runs_scored = (select max(bas.runs_scored))


--13. List all players whose bating average is above the overall average of all players.


--14. Find formats where more than 1 player has scored 5000+ runs.


--15. Show players who have NEVER scored a century in ANY format (only subqueries). 

