/*66. Faça uma View que contenha o número do pedido, código e descrição do produto, quantidade ,
val_unit e o subtotal (quantidade * val_unit).*/

create or replace VIEW exe66 as select num_pedido, produto.codigo_produto, descricao_produto,quantidade,val_unit, 
	(quantidade * val_unit) as subtotal
	from item_do_pedido
	inner join produto on produto.codigo_produto = item_do_pedido.codigo_produto;
	
	


select * from exe66;