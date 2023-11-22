/*83. Crie um Trigger que ao inserir ou alterar um registro da tabela item do pedido
apareça uma mensagem informando que os dados foram alterados com sucesso.*/

create or replace function exe83() returns trigger as $$
begin
	RAISE NOTICE 'Os dados do pedido foram alterados com sucesso!';
	RETURN new;
end;
$$ language plpgsql;

create trigger t_pedido_alterado 
after insert or update on item_do_pedido
for each row execute procedure exe83();