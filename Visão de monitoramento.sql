-- Monitoramento de uso da memória RAM
CREATE VIEW vw_monitoramento_memoria AS
SELECT table_name, 
       ROUND(SUM(allocated) / 1024 / 1024, 2) AS memoria_mb,
       SUM(data_pages) AS paginas_dados
FROM sys.innodb_buffer_stats_by_table
WHERE object_schema = 'database_desempenho'
GROUP BY table_name
ORDER BY memoria_mb DESC;