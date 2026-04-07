SELECT TOP (25)
    qs.execution_count,
    qs.total_worker_time / 1000 AS total_cpu_ms,
    qs.last_worker_time / 1000 AS last_cpu_ms,
    qs.total_elapsed_time / 1000 AS total_elapsed_ms,
    qs.last_execution_time,
    DB_NAME(st.dbid) AS database_name,
    SUBSTRING(
        st.text,
        (qs.statement_start_offset / 2) + 1,
        (
            (CASE qs.statement_end_offset
                WHEN -1 THEN DATALENGTH(st.text)
                ELSE qs.statement_end_offset
             END - qs.statement_start_offset) / 2
        ) + 1
    ) AS statement_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_worker_time DESC;
