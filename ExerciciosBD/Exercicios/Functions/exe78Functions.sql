/*78.Desenvolva uma função que mostre descrição do produto, a quantidade de
produtos vendidos, o Preço Unitário e o total (quantidade*Preço Unitário) de um
determinado Pedido.*/

create or replace function exe78(pedido_num integer) returns table(descricao_produto varchar(30), quantidade numeric, val_unit numeric, total numeric)
as $$

begin
	return query select produto.descricao_produto, item_do_pedido.quantidade, produto.val_unit, (item_do_pedido.quantidade*produto.val_unit) as total from produto 
    inner join item_do_pedido on produto.codigo_produto = item_do_pedido.codigo_produto
    inner join pedido on item_do_pedido.num_pedido = pedido.num_pedido where pedido.num_pedido = pedido_num;
end;

$$ language plpgsql;
select * from exe78(101);