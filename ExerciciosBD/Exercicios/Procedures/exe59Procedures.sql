/*59.Selecione a descrição dos produtos que possuem o valor unitário abaixo da
média.*/

create or replace function exe59() returns varchar(30) as $$
begin
	select descricao_produto, val_unit from produto where val_unit < (select avg(val_unit) from produto);
    
end;

$$
language plpgsql;
