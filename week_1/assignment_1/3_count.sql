-- Question 3: Count records  (Multiple choice)
-- How many taxi trips were totally made on January 15?
-- 20689
-- 20530
-- 17630
-- 21090

select 
    count(*) 
from 
    public.green_taxi_trips 
WHERE 
    date(tpep_pickup_datetime) = date('2019-01-15') and
    date(tpep_dropoff_datetime) = date('2019-01-15');


