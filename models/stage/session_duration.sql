select
       a.sessionid,
       a.time as start_time,
       b.time as end_time,
       a.logid,
       DATEDIFF(minute,a.time, b.time) AS sess_len_min,
       row_number() over (partition by a.logid order by a.time asc) as session_number
from (
    (
select
    *
        from
    events_raw
    where type='StartSession'
     )a
left join(
    select
        *
    from events_raw
    where type='EndSession'
)b
on a.sessionid = b.sessionid
and a.logid = b.logid)



