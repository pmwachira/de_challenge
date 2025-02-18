select
logid
from {{ref('device_assign')}}
where schoolid is null