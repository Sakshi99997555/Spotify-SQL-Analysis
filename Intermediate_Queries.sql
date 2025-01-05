-- Intermediate Queries --

-- Calculate the average danceability of tracks in each album 

select album,avg(danceability) as avg_danceability
from spotify
group by 1
order by 2 desc;

-- Q2 Find the top 5 tracks with the highest energy values
select track,max(energy)
from spotify
group by 1
order by 2 desc
limit 5 ;

-- Q3 List all the tracks along with their views and likes where they have official video 
select track,sum(likes)as total_likes,sum(views) as total_views
from spotify
where official_video='true'
group by 1
order by 2 desc;

--Q4 For each album calculate the total views of all associated tracks
select album,track,sum(views) as total_views
from spotify 
group by 1,2
order by 3 desc;

-- Q5 Retrive the track names that have been streaming on spotify more than youtube 
select track,stream,most_played_on from spotify;
select * from
	(select track,
	sum(case when most_played_on='youtube' then stream end) as most_played_on_youtube,
	sum(case when most_played_on='spotify' then stream end) as most_played_on_spotify
	from spotify
	group by track) as t1
	where most_played_on_spotify >most_played_on_youtube
	and
	most_played_on_youtube <> 0;

-- Option 2

SELECT 
    track
FROM 
    spotify
WHERE 
    most_played_on = 'spotify'
    AND stream > (
        SELECT 
            stream 
        FROM 
            spotify 
        WHERE 
            most_played_on = 'youtube' 
            AND spotify.track = track
    );


	
