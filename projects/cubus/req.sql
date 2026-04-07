SELECT
    r.session_id,
    r.status,
    r.start_time,
    r.command,
    r.cpu_time,
    r.total_elapsed_time,
    r.logical_reads,
    r.reads,
    r.writes,
    s.login_name,
    s.host_name,
    s.program_name,
    st.text AS sql_text
FROM sys.dm_exec_requests r
         JOIN sys.dm_exec_sessions s
              ON r.session_id = s.session_id
         CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) st
WHERE r.session_id <> @@SPID
ORDER BY r.cpu_time DESC;
