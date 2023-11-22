/*58.Liste os clientes que não fizeram nenhum pedido.*/
create or replace function exe58() returns table(nomee varchar(30)) as $$
declare 
begin
	return query SELECT nome_cliente
	FROM cliente
	WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pedido);

end;
$$
language plpgsql;
select exe58();