
-- Crie um gatilho de forma que na alteração de funcionários, não permita que o salário de um funcionário seja reduzido

CREATE FUNCTION verifica_salario() RETURNS TRIGGER AS $$
    BEGIN
        if (new.salario < old.salario) THEN
           RAISE EXCEPTION 'Negado! Nao é possível reduzir o salario';
        END IF;
        return new;
    END;
$$
LANGUAGE plpgsql;

SET search_path TO public;
CREATE TRIGGER fReducaoSalario BEFORE UPDATE OF salario on Funcionarios
FOR EACH ROW execute procedure verifica_salario();

-- 2
CREATE OR REPLACE FUNCTION verifica_cpf_paciente() RETURNS TRIGGER AS $$
    DECLARE
        linhas_afetadas integer default 0;
    BEGIN
         PERFORM * FROM medicos where cpf = new.cpf;
         GET diagnostics linhas_afetadas = ROW_COUNT;
         if (linhas_afetadas > 0) THEN
             RAISE EXCEPTION 'Negado! O CPF pertence a um médico';
         END IF;
         RETURN new;
    END;
    $$
LANGUAGE plpgsql;

create trigger fValidaCpfPaciente BEFORE insert on pacientes
    FOR EACH ROW execute procedure verifica_cpf_paciente();

-- 3
CREATE OR REPLACE FUNCTION valida_medico_ambulatorio() RETURNS TRIGGER AS $$
    DECLARE
        linhas_afetadas integer default 0;
    BEGIN
        PERFORM * FROM medicos where nroa = new.nroa;
        get diagnostics linhas_afetadas = ROW_COUNT;

        if (linhas_afetadas > 0) THEN
            RAISE EXCEPTION 'O ambulatorio ja possui um medico responsavel';
        end if;
        RETURN NEW;
    end;
    $$ LANGUAGE plpgsql;