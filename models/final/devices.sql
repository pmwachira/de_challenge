select
a.*,
b.*
from {{ref('devices_ids')}} a
left join (
   select
*
from {{ref('session_duration')}} a
where device_session_number = 1 
)b
on a.logid = b.logid