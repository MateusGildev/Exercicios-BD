/*55.Crie uma consulta que liste o código, o nome e o número do pedido que foram
realizados por todos os vendedores.*/

create or replace function exe54() returns table(cod_prod integer, nome varchar(30), num_ped integer) as $$
declare
	
begin
	return query select item_do_pedido.codigo_produto,descricao_produto,num_pedido from produto inner join item_do_pedido 
	on item_do_pedido.codigo_produto = produto.codigo_produto;

end;
$$
language plpgsql;
select exe54();
