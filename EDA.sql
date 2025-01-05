-- EDA--
select * from spotify
limit 100;

--count Rows--
select count(*) from spotify;

--Count Artist 
select count(distinct (artist)) from spotify;

-- count Album--
select count(distinct(album)) from spotify;

--Album Type--
select distinct(album_type) from spotify;

--MIN & MAX Duration min --
select min(duration_min) from spotify;
select max(duration_min) from spotify;

-- Check whether we have 0 duration min --
select * from spotify
where duration_min=0;

-- Deleted Records where duration min is 0 --
delete from spotify 
where duration_min=0;

--No of channels we have 
select distinct(most_played_on) from spotify;