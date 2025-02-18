select 
    time as time_,
    logid
from events_raw
where type = 'SetLogType'
and logtype = 'Device'