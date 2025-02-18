select
    sessionid,
    time as time_,
    logid,
    type
from
events_raw
where type in ('StartSession','EndSession')