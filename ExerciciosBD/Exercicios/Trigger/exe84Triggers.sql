CREATE OR REPLACE FUNCTION registrar_salario_antigo()
  RETURNS TRIGGER AS
$$
BEGIN

    IF NEW.salario_fixo <> OLD.salario_fixo THEN
        
        INSERT INTO historico_salario (codigo_vendedor, salario_antigo, data_alteracao)
        VALUES (OLD.id, OLD.salario_fixo, CURRENT_TIMESTAMP);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER alteracao_salario_vendedor_trigger
BEFORE UPDATE ON Vendedor
FOR EACH ROW
EXECUTE FUNCTION registrar_salario_antigo();