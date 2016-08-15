SELECT T.team_id as team_id,
       G.season_year as season_year, 
       sum(case when G.home_score > G.away_score THEN 1 ELSE 0 END) as wins,
       sum(case when G.home_score > G.away_score THEN 0 ELSE 1 END) as losses
  FROM public.game G
  JOIN public.team T ON home_team = T.team_id OR away_team = T.team_id
  WHERE season_type='Regular' OR season_type='Postseason'
  GROUP BY season_year, T.team_id
  
