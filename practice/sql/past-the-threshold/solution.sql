select 
    u.user_id,
    count(*) as session_count
  from users u
  join user_sessions s on u.user_id = s.user_id 
  group by u.user_id
  having count(*) > 3
