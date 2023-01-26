-- Question 6: Largest tip (Multiple choice)
-- For the passengers picked up in the Astoria Zone which was the drop up zone that had the largest tip?
-- Central Park
-- Jamaica
-- South Ozone Park
-- Long Island City/Queens Plaza

with max_tip_drop as (
    select 
        "DOLocationID" as loc_id, 
        tip_amount 
    from 
        green_taxi_trips 
    WHERE 
        "PULocationID" = 7 and 
        tip_amount = (
            select 
                max(tip_amount) 
            from
                green_taxi_trips 
            where
                green_taxi_trips."PULocationID" = 7
        )
)
select
    taxi_zone_lookup.*
from 
    max_tip_drop
left join taxi_zone_lookup
on max_tip_drop.loc_id = taxi_zone_lookup."LocationID";