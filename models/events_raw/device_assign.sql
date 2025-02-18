select
    time,
    logid,
    schoolid,
    --flag latest assignment
    row_number over (partion by logid order by time) as latest_assign
from events_raw
where type = 'AssignToSchool'