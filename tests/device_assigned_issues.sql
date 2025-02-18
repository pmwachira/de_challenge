select 
logid
from 
{{ref('device_assign_timeline')}}
where assign_time is null
or (deassign_time is not null and deassign_time<assign_time)
or schoolid is null

