select
    time_ as assign_time,
    LEAD(time_) OVER (PARTITION BY logid, schoolid ORDER BY time_ asc) AS deassign_time,
    logid,
    schoolid,
    --catch school_names on same id
    row_number() over (partition by logid order by time_) as latest_school_assign
from {{ref('device_assign')}}

