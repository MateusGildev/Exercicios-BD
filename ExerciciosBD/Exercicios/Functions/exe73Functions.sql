create or replace function exe73(total_vendedores int) returns integer as 
$$
DECLARE
	tot_vendedores integer;
begin
	select count(*) from vendedor where codigo_vendedor = total_vendedores
	into tot_vendedores;
	return tot_vendedores;
end;
$$
language plpgsql;

select exe73(0);