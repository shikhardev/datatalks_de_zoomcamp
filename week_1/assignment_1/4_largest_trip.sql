-- Question 4: Largest trip for each day (Multiple choice)
-- Which was the day with the largest trip distance?
-- 2019-01-18
-- 2019-01-28
-- 2019-01-15
-- 2019-01-10
select 
    date(lpep_pickup_datetime) as pickup_date, 
    trip_distance 
from 
    public.green_taxi_trips 
order by trip_distance desc limit 1;
