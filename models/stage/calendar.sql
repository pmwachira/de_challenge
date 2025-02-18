SELECT
    dateadd(day, -num, current_date) as day_
FROM {{ref('numbers')}}
WHERE num <= (
    select
        datediff(day, earliest, current_date)
    from (
        select min(time) as earliest
        from events_raw
    )
    )