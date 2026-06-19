SELECT * FROM pedidos 
p JOIN clientes c ON p.cliente_id = c.id 
WHERE YEAR(p.data_pedido) = 2026 
AND p.status = 'PENDENTE';

SELECT p.id, p.data_pedido, p.valor_total, c.nome, c.email
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id
WHERE p.data_pedido >= '2026-01-01 00:00:00' 
  AND p.data_pedido <= '2026-12-31 23:59:59'
  AND p.status = 'PENDENTE';