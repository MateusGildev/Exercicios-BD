/*72. Mostre os códigos e descrições dos produtos e a soma da quantidade pedida agrupado pelo
código e descrição do produto.*/
/*DUVIDA!!!!!*/


create or replace view exe72 as
select item_do_pedido.codigo_produto, descricao_produto, quantidade from produto inner join item_do_pedido 
on item_do_pedido.codigo_produto = produto.codigo_produto; 


select * from exe72;