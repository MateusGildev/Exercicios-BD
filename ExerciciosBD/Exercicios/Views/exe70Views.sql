/*70. Com base na visualização anterior crie uma consulta que mostre o nome do vendedor, o Salário
Fixo, Salário Total que é a soma Salário fixo + 5% do total de produto vendidos {Salário
Fixo+(Total*0.05)} . Obs: elimine as linhas duplicadas.*/

create or replace view exe70 as 
select nome_vendedor, salario_fixo, (salario_fixo+((quantidade*val_unit)*0.05)) as salario_tot
from vendedor inner join pedido ON pedido.codigo_vendedor = vendedor.codigo_vendedor
inner join item_do_pedido ON item_do_pedido.num_pedido = pedido.num_pedido
inner join produto ON produto.codigo_produto = item_do_pedido.codigo_produto;

select * from exe70;