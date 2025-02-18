select 
sessionid
from {{ref('session_duration')}}
where sess_len_min>60*24*7