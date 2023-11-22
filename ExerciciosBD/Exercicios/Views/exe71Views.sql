/*71. Tendo como referência uma das views criadas anteriormente, mostre a média do total dos
pedidos que o vendedor ‘José’ participou.*/

create or replace view exe71 as
select avg(quantidade) from item_do_pedido inner join pedido 
ON pedido.num_pedido = item_do_pedido.num_pedido where codigo_vendedor = 209;

select * from exe71;