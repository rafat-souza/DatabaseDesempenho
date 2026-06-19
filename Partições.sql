-- Ajuste da chave primária (exigência do motor InnoDB para particionamento temporal)
ALTER TABLE pedidos DROP PRIMARY KEY, ADD PRIMARY KEY (id, data_pedido);

-- Particionamento por ano
ALTER TABLE pedidos 
PARTITION BY RANGE COLUMNS(data_pedido) (
    PARTITION p_2024 VALUES LESS THAN ('2025-01-01'),
    PARTITION p_2025 VALUES LESS THAN ('2026-01-01'),
    PARTITION p_2026 VALUES LESS THAN ('2027-01-01'),
    PARTITION p_futuro VALUES LESS THAN (MAXVALUE)
);