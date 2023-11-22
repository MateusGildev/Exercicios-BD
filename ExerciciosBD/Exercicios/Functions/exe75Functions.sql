/*75.Faça uma função que mostre os vendedores que atenderam um cliente, cujo seu
nome é passado por parâmetro.*/
CREATE OR REPLACE FUNCTION exe75(nome_cliente varchar(30)) RETURNS TABLE (nome_vendedor varchar(30)) AS $$
BEGIN
    RETURN QUERY
    SELECT vendedor.nome_vendedor
    FROM vendedor
    INNER JOIN pedido ON vendedor.codigo_vendedor = pedido.codigo_vendedor
    INNER JOIN cliente ON pedido.codigo_cliente = cliente.codigo_cliente
    WHERE cliente.nome_cliente = cliente.nome_cliente;
END;
$$ LANGUAGE plpgsql;
select distinct exe75('Sebastião');