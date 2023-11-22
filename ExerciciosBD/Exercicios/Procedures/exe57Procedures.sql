/*57.Selecione os nomes dos clientes de qualquer pedido cujo prazo de entrega seja
maior do que 25 dias. (resolva utilizando subconsultas)*/

create or replace function exe57() returns TABLE(nome varchar(40), prazo smallint) as $$
declare nome varchar(40);
BEGIN
	return query select nome_cliente,prazo_entrega from cliente inner join pedido 
	ON pedido.codigo_cliente = cliente.codigo_cliente where prazo_entrega > 25;
	
end;
$$
language plpgsql;
select exe57();
