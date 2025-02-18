select
sessionid,
start_time,
end_time,
schoolid,
c.name
from {{ref('session_duration')}} a
left join
(
    select 
        *
    from {{ref('device_assign_timeline')}}
)b
on a.logid = b.logid
and (
    start_time>=assign_time and end_time<=deassign_time
    or start_time>=assign_time and deassign_time is null
)
left join {{ref('school_name')}} c
on b.schoolid=c.logid