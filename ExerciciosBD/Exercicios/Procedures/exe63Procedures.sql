/*63.Exiba os nomes dos clientes que fizeram pedidos cuja quantidade do item
pedido seja maior que sua média.*/

create or replace function exe63() returns table(nome_cliente varchar(30)) as $$
begin
	return query select nome_cliente from cliente inner join pedido
    on cliente.codigo_cliente = pedido.codigo_cliente inner join item_do_pedido
    on pedido.num_pedido = item_do_pedido.num_pedido where quantidade > (select avg(quantidade) from item_do_pedido);
end;

$$ language plpgsql;
