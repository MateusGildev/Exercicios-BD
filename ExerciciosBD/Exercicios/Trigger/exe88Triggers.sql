/*88. Crie um Trigger que ao ser inserido um novo item do pedido atualize o campo
quantidade em estoque da tabela produto.*/

CREATE FUNCTION exe88() RETURNS TRIGGER AS $$
BEGIN
    UPDATE item_do_pedido
    SET quantidade = quantidade - NEW.quantidade
    WHERE codigo = NEW.codigo_produto;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_estoque
AFTER INSERT ON item_do_pedido
FOR EACH ROW
EXECUTE FUNCTION exe88();

INSERT INTO item_do_pedido (codigo_produto, quantidade) VALUES (789, 4);