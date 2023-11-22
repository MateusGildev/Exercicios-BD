/* 76.Crie uma função que retorne todos os códigos, nomes e unidades dos produtos
cadastrados. */ 

create or replace function exe76() returns table(codigo_prod integer, nome varchar(40), unid_prod char(3)) as $$
declare
	cod_prod INTEGER;
	nome_prod varchar(20);
	uni_prod integer;
begin
	return query select codigo_produto,descricao_produto,unidade from produto;

end;

$$
language plpgsql;
select exe76();


