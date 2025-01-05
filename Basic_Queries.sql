-- Basic QUeries --

-- Q1 Retrive the names of all tracks that have more than 1 billion streams --

	select track from spotify
	where stream > 1000000000;

--Q2 List all the albums along with their respective artist 
	select distinct(album),artist
	from spotify
	order by 1;

--Q3 Get the total number of comments for tracks where licensed is true --

select sum(comments) as total_comments
from spotify 
where licensed='true';

-- Q4 find all the tracks that belong to the  ablum type 'single'
select track 
from spotify
where album_type ='single';

--Q5 count total number of tracks by each artist --

select artist,count(*) as total_tracks
from spotify
group by artist
order by 2 desc;
