SELECT m.season, m.home_team_goal, m.away_team_goal,m.B365H, m.B365D, m.B365A, m.BWH, m.BWD, m.BWA, m.IWH, m.IWD, m.IWA, m.LBH, m.LBD, m.LBA,
m.WHH, m.WHD, m.WHA, m.VCH, m.VCD, m.VCA, c.name country_name, l.name league_name, t1.team_long_name home_team, t2.team_long_name away_team
FROM match m
/* to get the country name instead of ID*/
JOIN country c
ON c.id = m.country_id
/* to get the home team name, use T1 so that we can use this table again for away teams*/
JOIN team t1
ON m.home_team_api_id = t1.team_api_id
/* to get the away team name, use T2 as we have joined the table already for the home team*/
JOIN team t2
ON m.away_team_api_id = t2.team_api_id
/* to get the league names instead of ID*/
JOIN league l
ON l.country_id = m.league_id
/* filtering so that we only see leagues in England or Spain as I see these are the biggest leagues in European football */
WHERE l.id = '1729' AND m.season = '2015/2016' OR l.id ='21518' AND m.season = '2015/2016';
