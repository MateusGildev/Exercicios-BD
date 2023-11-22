/*61.Encontre os nomes dos clientes que possuem o prazo de entrega acima da
média.*/

CREATE OR REPLACE FUNCTION exe61() RETURNS TABLE (nome_cliente varchar(30)) AS $$
BEGIN
    RETURN QUERY SELECT cliente.nome_cliente
                 FROM cliente inner join pedido
                 on cliente.codigo_cliente = pedido.codigo_cliente
                 WHERE prazo_entrega > (SELECT AVG(prazo_entrega) FROM pedido);
END;
$$ LANGUAGE plpgsql;
select exe61();
