-- Criação de usuário exclusivo para a aplicação realizar operações de leitura
CREATE USER 'app_leitura'@'%' IDENTIFIED BY 'senha_segura_leitura';
GRANT SELECT ON database_desempenho.* TO 'app_leitura'@'%';
FLUSH PRIVILEGES;

CREATE TABLE log_invalidacao_cache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela VARCHAR(50),
    registro_id INT,
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_invalida_cache_produto
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    INSERT INTO log_invalidacao_cache (tabela, registro_id) 
    VALUES ('produtos', NEW.id);
END; //
DELIMITER ;