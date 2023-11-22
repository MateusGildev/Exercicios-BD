/*89. Crie um Trigger que ao ser alterado um item do pedido atualize o campo
quantidade em estoque da tabela produto.*/

CREATE OR REPLACE FUNCTION atualizar_estoque_pedido()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE produtos
    SET quantidade = quantidade + OLD.quantidade - NEW.quantidade
    WHERE id = NEW.codigo_produto;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_estoquee
AFTER UPDATE ON pedido
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque_pedido();

UPDATE produto
SET quantidade = 4
WHERE codigo_produto = 1;