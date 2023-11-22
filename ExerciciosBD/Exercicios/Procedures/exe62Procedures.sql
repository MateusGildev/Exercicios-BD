/*62.Selecione a descrição do produto que teve a maior quantidade pedida.*/

CREATE OR REPLACE FUNCTION exe62() RETURNS varchar(30) AS $$
DECLARE
    max_quantidade INTEGER;
    max_descricao VARCHAR(30);
BEGIN
    SELECT MAX(quantidade), descricao_produto
    INTO max_quantidade, max_descricao
    FROM produto
    INNER JOIN item_do_pedido ON produto.codigo_produto = item_do_pedido.codigo_produto
    GROUP BY descricao_produto
    ORDER BY max_quantidade DESC;

    RETURN max_descricao;
END;
$$ LANGUAGE plpgsql;
select exe62();
