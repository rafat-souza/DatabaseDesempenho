-- Identificação de gargalo na junção de tabelas para relatório de vendas
EXPLAIN ANALYZE 
SELECT c.nome, SUM(ip.quantidade * ip.preco_unitario) AS receita
FROM categorias c
JOIN produtos p ON c.id = p.categoria_id
JOIN itens_pedido ip ON p.id = ip.produto_id
JOIN pedidos pd ON ip.pedido_id = pd.id
WHERE pd.data_pedido >= '2025-01-01 00:00:00' 
  AND pd.data_pedido <= '2025-12-31 23:59:59'
GROUP BY c.nome;

-- Índices compostos e de chaves estrangeiras para resolver as varreduras da consulta acima
CREATE INDEX idx_pedidos_data_status ON pedidos (data_pedido, status);
CREATE INDEX idx_produtos_categoria ON produtos (categoria_id);
CREATE INDEX idx_itens_produto ON itens_pedido (produto_id);
CREATE INDEX idx_itens_pedido ON itens_pedido (pedido_id);
CREATE INDEX idx_clientes_cpf ON clientes (cpf);