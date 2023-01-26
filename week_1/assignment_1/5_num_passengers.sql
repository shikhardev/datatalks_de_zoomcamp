-- Question 5: The number of passengers  (Multiple choice)
-- In 2019-01-01 how many trips had 2 and 3 passengers?
-- 2: 1282 ; 3: 266
-- 2: 1532 ; 3: 126
-- 2: 1282 ; 3: 254
-- 2: 1282 ; 3: 274

select 
    count(*), 
    passenger_count
from 
    public.green_taxi_trips
where
    date(lpep_pickup_datetime) = date('2019-01-01') and
    (
        passenger_count = 2 or
        passenger_count = 3
    )
group by 
    passenger_count;
