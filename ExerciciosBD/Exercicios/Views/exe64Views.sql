/*64. Crie uma View contendo os códigos e os nomes dos clientes que moram nos estados de SP ou
RJ ou MS.*/

create or replace view exe64 as
select codigo_cliente, nome_cliente from cliente where uf = 'SP' OR UF='RJ' OR UF = 'MS';

SELECT * FROM EXE64;