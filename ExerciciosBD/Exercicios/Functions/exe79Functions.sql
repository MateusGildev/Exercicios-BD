/*79.Desenvolva uma função que retorne a soma de uma venda de um determinado
pedido.*/

create or replace function exe79() returns table(pedido_num integer, soma numeric) as $$
begin
	return query select pedido.num_pedido, sum(item_do_pedido.quantidade*produto.val_unit) as soma from pedido
    inner join item_do_pedido on pedido.num_pedido = item_do_pedido.num_pedido
    inner join produto on item_do_pedido.codigo_produto = produto.codigo_produto GROUP BY pedido.num_pedido;
    
end;
$$ language plpgsql;
select * from exe79();