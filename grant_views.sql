create user doutor;
GRANT insert, update, delete, select on public.pacientes TO doutor;

create user estag;
GRANT SELECT (codm, codp, data) ON TABLE public.consultas TO estag;

create user secretaria;
SET search_path TO public;

CREATE VIEW vMedicos4 AS SELECT m.* FROM Medicos m JOIN Ambulatorios a ON a.nroa = m.nroa WHERE a.andar = 4;
GRANT SELECT ON vMedicos4 TO secretaria;

--4
create user U1;
create user U2;

CREATE ROLE QUERY;
GRANT SELECT ON Pacientes, Medicos TO QUERY;
GRANT QUERY TO U1, U2;


--5
-- Criar uma visao que retorne o nome dos pacientes que foram atendidos por m�dicos que trabalham em ambulat�rios do quarto andar.
CREATE VIEW vAmbulatorios4 AS
SELECT nroa FROM Ambulatorios WHERE andar=4;

CREATE VIEW vMedicos4 AS
SELECT codm FROM Medicos WHERE nroa IN(Select nroa From vAmbulatorios4);

--SELECT codm FROM Medicos NATURAL JOIN vAmbulatorios4;

CREATE VIEW vPacientes4 AS
SELECT nome FROM Pacientes NATURAL JOIN Consultas NATURAL JOIN vMedicos4;