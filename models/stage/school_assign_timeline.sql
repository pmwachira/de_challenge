select
    time_ as assign_time,
    LEAD(time_) OVER (PARTITION BY logid ORDER BY time_ asc) AS deassign_time,
    logid,
    name,
    --catch school_names on same id
    row_number() over (partition by logid order by time_) as latest_school_name
from {{ref('school_name')}}
