select
    time as time_,
    logid,
    schoolid,
    --flag latest assignment
    row_number() over (partition by logid order by time) as latest_assign
from events_raw
where type = 'AssignToSchool'