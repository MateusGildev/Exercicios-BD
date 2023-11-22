/*80.Faça uma função que retorne a quantidade de pedidos que cada vendedor
participou.*/

CREATE OR REPLACE FUNCTION exe80()
RETURNS TABLE (nome_vendedor TEXT, quantidade NUMERIC, num_pedido integer) AS $$
BEGIN
    RETURN QUERY
    SELECT vendedor.nome_vendedor, item_do_pedido.quantidade, pedido.num_pedido
    FROM vendedor
    INNER JOIN pedido ON pedido.codigo_vendedor = vendedor.codigo_vendedor
    INNER JOIN item_do_pedido ON item_do_pedido.num_pedido = pedido.num_pedido;
END;
$$ LANGUAGE plpgsql;


select * from exe80();