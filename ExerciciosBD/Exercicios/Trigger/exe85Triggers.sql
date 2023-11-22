/*85. Crie um trigger que ao inserir um registro da tabela item do pedido, calcule e
armazene o seu subtotal.*/

CREATE OR REPLACE FUNCTION calcular_subtotal()
  RETURNS TRIGGER AS
$$
DECLARE
    produto_preco DECIMAL(10, 2);
BEGIN
    -- Buscar o preço unitário do produto na tabela produto
    SELECT val_unit INTO produto_preco FROM produto WHERE id = NEW.produto_id;
    
    -- Calcular subtotal
    NEW.subtotal := NEW.quantidade * produto_preco;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Criação do trigger
CREATE TRIGGER calculo_subtotal_trigger
BEFORE INSERT ON item_do_pedido
FOR EACH ROW
EXECUTE FUNCTION calcular_subtotal();

INSERT INTO item_do_pedido (quantidade,  produto_preco) VALUES (3, 10.99);