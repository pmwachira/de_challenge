select
    time as assign_time,
    LEAD(time) OVER (PARTITION BY logid ORDER BY time asc) AS deassign_time,
    logid,
    name,
    --catch school_names on same id
    row_number() over (partition by logid order by time) as latest_school_name
from events_raw
where type = 'SetName'
