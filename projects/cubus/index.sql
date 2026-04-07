SELECT
    'CREATE INDEX IX_'
        + OBJECT_NAME(mid.object_id, mid.database_id) + '_'
        + REPLACE(
            REPLACE(
                    REPLACE(
                            REPLACE(
                                    REPLACE(
                                            ISNULL(mid.equality_columns, '')
                                                + CASE
                                                      WHEN mid.equality_columns IS NOT NULL
                                                          AND mid.inequality_columns IS NOT NULL
                                                          THEN ','
                                                      ELSE ''
                                                END
                                                + ISNULL(mid.inequality_columns, ''),
                                            '[InstallationId], ', ''
                                    ),
                                    ', [InstallationId]', ''
                            ),
                            '[', ''
                    ),
                    ']', ''
            ),
            ', ', '_'
          )
        + ' ON '
        + OBJECT_SCHEMA_NAME(mid.object_id, mid.database_id)
        + '.'
        + OBJECT_NAME(mid.object_id, mid.database_id)
        + ' ('
        + ISNULL(mid.equality_columns, '')
        + CASE
              WHEN mid.equality_columns IS NOT NULL
                  AND mid.inequality_columns IS NOT NULL
                  THEN ', '
              ELSE ''
        END
        + ISNULL(mid.inequality_columns, '')
        + ')'
        + CASE
              WHEN mid.included_columns IS NOT NULL
                  THEN ' INCLUDE (' + mid.included_columns + ')'
              ELSE ''
        END AS create_index_statement,

    OBJECT_NAME(mid.object_id, mid.database_id) AS table_name,
    (migs.user_seeks + migs.user_scans) * migs.avg_total_user_cost * migs.avg_user_impact AS score,
    migs.user_seeks,
    migs.user_scans,
    migs.avg_total_user_cost,
    migs.avg_user_impact,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM sys.dm_db_missing_index_group_stats migs
         JOIN sys.dm_db_missing_index_groups mig
              ON migs.group_handle = mig.index_group_handle
         JOIN sys.dm_db_missing_index_details mid
              ON mig.index_handle = mid.index_handle
ORDER BY score DESC;
