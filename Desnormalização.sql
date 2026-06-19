-- Isolar histórico de pedidos e evitar joins no futuro
ALTER TABLE itens_pedido 
ADD COLUMN snapshot_nome_produto VARCHAR(100) AFTER produto_id,
ADD COLUMN snapshot_preco_unitario DECIMAL(10,2) AFTER snapshot_nome_produto;

-- Atualização dos dados legados para preencher a nova estrutura
UPDATE itens_pedido ip
INNER JOIN produtos p ON ip.produto_id = p.id
SET ip.snapshot_nome_produto = p.nome,
    ip.snapshot_preco_unitario = p.preco;