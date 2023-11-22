/*56.Relacionem todos os produtos que participaram ou não de algum pedido. (Liste
o código e o nome do produto, o número do pedido e a quantidade vendida).*/

create or replace function exe56() returns table
(codigo_produto integer,num_ped integer, quantidade numeric,descricao_produto character VARYING(30)) as $$

declare
begin
	return query select item_do_pedido.codigo_produto,num_pedido, item_do_pedido.quantidade, produto.descricao_produto from item_do_pedido inner join produto
	ON produto.codigo_produto = item_do_pedido.codigo_produto;
end;
$$
language plpgsql;
select exe56();
