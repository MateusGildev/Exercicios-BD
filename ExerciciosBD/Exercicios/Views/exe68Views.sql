/*68. Em relação ao exercício anterior desenvolva uma visualização que contenha o Número do
Pedido, Código, o Nome e o salário fixo do Vendedor e o Total.*/

create or replace view exe68 as 
select num_pedido, pedido.codigo_vendedor, nome_vendedor, salario_fixo 
from pedido inner join vendedor on vendedor.codigo_vendedor = pedido.codigo_vendedor;

select * from exe68;