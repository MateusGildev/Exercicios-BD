/*87. Desenvolver um Trigger que ao ser alterado o endereço do cliente (endereço e
cep) insira o endereço antigo na tabela histórico de endereço.*/

CREATE OR REPLACE FUNCTION inserir_endereco_antigo()
  RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO historico_endereco (codigo_cliente, endereco_antigo, cep_antigo)
    VALUES (OLD.id, OLD.endereco, OLD.cep);
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER historico_endereco_trigger
BEFORE UPDATE ON cliente
FOR EACH ROW
WHEN (OLD.endereco <> NEW.endereco OR OLD.cep <> NEW.cep)
EXECUTE FUNCTION inserir_endereco_antigo();

INSERT INTO cliente (codigo_cliente, nome_cliente, endereco, cep) VALUES (1, 'João Silva', 'Rua A', '12345-678');
select * from cliente;

