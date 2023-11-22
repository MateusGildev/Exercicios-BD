/*77.Faça uma função que mostre o maior, o menor e a média de salário dos
vendedores que atenderam uma determinada cliente cujo nome do cliente e faixa
de comissão do vendedor é passado por parâmetro.*/

create or replace function exe77(cliente_nome varchar(30), comissao varchar(1)) returns table(maior numeric, menor numeric , media numeric) as $$
declare
begin
	return query select max(vendedor.salario_fixo) as maior, min(vendedor.salario_fixo) as menor, avg(vendedor.salario_fixo) as media from cliente
    inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente
    inner join vendedor on pedido.codigo_vendedor = vendedor.codigo_vendedor
    where cliente.nome_cliente = cliente_nome and vendedor.faixa_comissao = comissao;
end;

$$ language plpgsql;
select exe77('Maurício', 'C');