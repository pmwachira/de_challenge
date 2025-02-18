select
       a.sessionid,
       a.time_ as start_time,
       b.time_ as end_time,
       a.logid,
       DATEDIFF(minute,a.time_, b.time_) AS sess_len_min,
       row_number() over (partition by a.logid order by a.time_ asc) as device_session_number
from (
    (
select
    *
    from {{ ref('sessions') }}
    where type='StartSession'
     )a
left join(
    select
        *
    from {{ref('sessions')}}
    where type='EndSession'
)b
on a.sessionid = b.sessionid
and a.logid = b.logid)



