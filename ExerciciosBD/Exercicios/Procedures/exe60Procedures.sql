-- FUNCTION: public.exe60()

-- DROP FUNCTION IF EXISTS public.exe60();

CREATE OR REPLACE FUNCTION exe60() returns table(cod_cliente integer) as $$

begin
	return query select pedido.codigo_cliente from pedido 
	where prazo_entrega > (select avg(prazo_entrega) from pedido);
	
end;

$$
language plpgsql;
select exe60();
    
