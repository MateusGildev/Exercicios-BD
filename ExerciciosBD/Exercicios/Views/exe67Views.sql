/*67. Tendo referencia ao exercício anterior, crie uma visualização que mostre a soma total de cada
pedido.*/

create or replace view exe67 as select quantidade,unidade,val_unit, (quantidade * val_unit) as soma_tot 
from item_do_pedido inner join produto on produto.codigo_produto = item_do_pedido.codigo_produto;

select * from exe67;
