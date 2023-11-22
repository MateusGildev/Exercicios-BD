CREATE OR REPLACE FUNCTION msg_produto_excluído()
RETURNS trigger AS $$
BEGIN

RAISE NOTICE 'Produto Excluído com sucesso!';
RETURN new;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_prod_excluido
AFTER DELETE
ON produto
FOR EACH ROW
EXECUTE PROCEDURE msg_produto_excluído();

DELETE FROM produto
WHERE codigo_produto=30

