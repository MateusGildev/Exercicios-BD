/*65. Crie uma View que selecione todos os números dos pedidos, códigos dos clientes e os prazos de
entrega dos vendedores que tenham o nome ‘Carlos’.*/

create or replace view exe65 AS
select num_pedido, codigo_cliente, prazo_entrega from pedido inner join vendedor
on vendedor.codigo_vendedor = pedido.codigo_vendedor where nome_vendedor = 'Carlos';


select * from exe65;