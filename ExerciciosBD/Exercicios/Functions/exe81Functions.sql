/*81.Crie uma função que retorne o código e o nome dos clientes, cujo código do
vendedor, o estado que reside o cliente e o prazo de entrega do pedido seja
passado por parâmetro.*/

create or replace function exe81(codigo_vend integer, estado text, prazo integer) 
returns table(cod_cli integer, nome varchar(40)) as $$
BEGIN
	return query select cliente.codigo_cliente, cliente.nome_cliente from cliente inner join pedido 
	ON pedido.codigo_cliente = cliente.codigo_cliente where pedido.codigo_vendedor = codigo_vend
	and cliente.uf = estado and pedido.prazo_entrega = prazo;
end;

$$ language plpgsql;

select exe81(11, 'RJ', 10);