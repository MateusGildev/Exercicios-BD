/*74.Elabore uma função para retornar a quantidade de pedidos que um determinado
vendedor participou.*/

create or replace function exe74(nome_vendedor varchar(30)) returns integer as $$
declare quantidade_pedidos integer;
begin
	select count(num_pedido) into quantidade_pedidos from pedido inner join vendedor
    on pedido.codigo_vendedor = vendedor.codigo_vendedor where vendedor.nome_vendedor = vendedor.nome_vendedor;
    return quantidade_pedidos;
end;

$$ language plpgsql;
select exe74('Josias');
