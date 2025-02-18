select 
time,
logid,
name,
--catch school_names on same id
row_number over (partion by logid order by time) as latest_school_name
 from events_raw
where type = 'SetName'