
use time_diff;
select *, 
case when sec_to_time(timestampdiff(second,timing,lead(timing) over(partition by train_no ORDER BY timing))) is null then "Destination Reached"
else  sec_to_time(timestampdiff(second,timing,lead(timing) over(partition by train_no ORDER BY timing))) end as Time_to_next_station
  from details;
  
select * , sec_to_time(timestampdiff(second,(timing),lag(timing) over(partition by train_no))) from details;