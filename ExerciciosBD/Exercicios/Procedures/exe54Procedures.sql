/*54.Selecionem os códigos e os nomes dos clientes, e seus respectivos prazos de
entrega dos pedidos de todos os clientes que fizeram ou não pedidos.*/

create or replace function exe55() returns table(codigo_cliente integer, nome varchar(40), prazo SMALLINT) as 
$$
declare
begin
	return query select distinct cliente.codigo_cliente, nome_cliente, prazo_entrega from cliente inner join pedido 
	ON pedido.codigo_cliente = cliente.codigo_cliente;
end;

$$
language plpgsql;
select exe55();