-- Q1 Find the top 3most viewed tracks for each artist using window function --
-- each artist and total views for each artist 
-- track with highest view for each artist
-- dense rank
-- filter rank <= 3
	with ranking_artist as
		(select artist,track,sum(views) as total_view,
		dense_rank() over(partition by artist order by sum(views) desc) as rank
		from spotify
		group by 1,2
		order by 1,3 desc)
	select * from ranking_artist
	where rank <=3;


-- Q2 Write a query to find tracks where the liveness score is above the average 
	select track,artist,liveness
	from spotify
	where liveness > (select avg(liveness) from spotify)

-- Q3 Use a with clause to calculate the difference betweeen the highest
-- and lowest energy vlalues for tracks in each album 

	with cte
	as 
		(select album,
		max(energy) as highest_energy,
		min(energy) as lowest_energy 
		from spotify
		group by 1 )
	select album ,
	highest_energy - lowest_energy as energy_difference
	from cte
	order by 2 desc;

-- Q4 find tracks where the energy-to-liveness ratio is greater than 1:2
	select track,
	energy/liveness as energy_to_liveness_ratio
	from spotify
	where energy/liveness > 1.2;

-- Q5 calculate the cumulative sum of likes for tracks ordered by the
-- number  of views using the window function 

	select track,
	sum(likes)over(order by views) as cummulative_sum
	from spotify
	order by sum(likes) over(order by views) desc;