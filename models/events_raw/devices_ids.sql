select 
time,
logid,
 from events_raw
where type = 'SetLogType'
and logtype = 'Device'