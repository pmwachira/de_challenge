with data as(select 
sessionid,
logid as device_id, 
day_ as date_,
round(case 
    --full day
    when day_>date(start_time) and day_<date(end_time)
    then 24*60
    when date(end_time)>date(day_) and date(day_)=date(start_time) then
    extract(epoch FROM (dateadd(day,1,day_) - start_time)) / 60 --next day
    else
    extract(epoch FROM (end_time - day_)) / 60 --same day
     end,0) usage_minutes     
 from {{ref('calendar')}}a
left join {{ref('session_duration')}}b
on date(a.day_) >= date(b.start_time)
and date(a.day_)<= date(b.end_time)
),
avgd as (
select 
device_id,
date_,
coalesce(sum(usage_minutes),0) as usage_minutes
from data
group by 1,2)

select
*,
avg(usage_minutes) over (order by date_ ROWS BETWEEN 7 PRECEDING AND CURRENT ROW) AS avg_usage_minutes_7d
from avgd
order by 2 asc

