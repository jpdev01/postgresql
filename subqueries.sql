SET search_path TO public;

-- Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. Resolva esta questão usando subconsultas com IN.
SELECT f.nome FROM funcionarios f WHERE f.matricula IN ( SELECT c.matricula FROM consultas c WHERE c.codanimal IN ( SELECT a."codAnimal" FROM animais a WHERE a."nomeAnimal" = 'Glória' ) );

-- Faça uma consulta SQL que mostre o nome dos animais que tem consultas marcadas sempre para dias anteriores ao dia 16 de quaisquer meses. Pesquise sobre a função date_part no PostgreSQL para fazer esta extração do dia. Além do nome, mostrar o nome da mãe destes animais. Resolva esta questão usando subconsultas com IN sem usar junções.
SELECT "nomeAnimal", "codAnimalMae" FROM animais WHERE "codAnimal" IN ( SELECT c.codanimal FROM consultas c WHERE date_part('day', c.data) < 16 ) AND "codAnimal" NOT IN ( SELECT c.codanimal FROM consultas c WHERE date_part('day', c.data) >= 16 );

-- Faça uma consulta SQL que mostre o nome e a idade do animal mais jovem. Caso haja mais de um animal com a idade mais jovem, mostrar todos estes. Resolva usando subconsultas com ANY/ALL e sem usar a função MIN.
SELECT "nomeAnimal", "dtNascAnimal"
FROM animais a
WHERE "dtNascAnimal" <= ALL (
    SELECT "dtNascAnimal"
    FROM animais
);

--Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. Resolva usando subconsultas com ANY/ALL
SELECT f.nome
FROM funcionarios f
WHERE f.matricula = ANY (
    SELECT c.matricula
    FROM consultas c
    WHERE c.codanimal = ANY (
        SELECT a."codAnimal"
        FROM animais a
        WHERE a."nomeAnimal" = 'Glória'
    )
);

--Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. Resolva usando subconsultas com EXISTS.
SELECT f.nome
FROM funcionarios f
WHERE EXISTS (
    SELECT 1
    FROM consultas c
    WHERE c.matricula = f.matricula
    AND EXISTS (
        SELECT 1
        FROM animais a
        WHERE a."codAnimal" = c.codanimal
        AND a."nomeAnimal" = 'Glória'
    )
);

--Faça uma consulta SQL que mostre o código e nome da espécie com a maior expectativa de vida. Caso haja mais de uma espécie com o maior valor, mostrar todas estas. Resolva usando subconsultas com EXISTS e sem usar a função MAX.
SELECT e.codespecie, e.nomeespecie

FROM especies e

WHERE NOT EXISTS (

    SELECT 1

    FROM especies e2

    WHERE e2.expectativaespecie > e.expectativaespecie

);

--Buscar o nome dos funcionários (veterinários) que já prescreveram medicamentos para coelhos. Procure resolver esta questão sem usar junções e produtos cartesianos.
SELECT nome
FROM funcionarios
WHERE matricula IN (
    SELECT matricula
    FROM consultas
    WHERE codanimal IN (
        SELECT "codAnimal"
        FROM animais
        WHERE "codEspecie" = (
            SELECT codespecie
            FROM especies
            WHERE nomeespecie = 'Coelho'
        )
    )
);


--Faça uma consulta para buscar o nome dos animais que são irmãos do animal que se chama Salti (por parte de pai e de mãe). Procure resolver estar questão usando apenas uma subconsulta.
SELECT "nomeAnimal"

FROM animais

WHERE "codAnimalMae" = (
    SELECT "codAnimalMae"
    FROM animais
    WHERE "nomeAnimal" = 'Salti'
)
AND "codAnimalPai" = (
    SELECT "codAnimalPai"
    FROM animais
    WHERE "nomeAnimal" = 'Salti'
)
AND "codAnimal" != (
    SELECT "codAnimal"
    FROM animais
    WHERE "nomeAnimal" = 'Salti'
);

--Buscar os nomes de todos os animais que são mais velhos que o animal que se chama Salti. Procure resolver esta questão com uma subconsulta.

SELECT "nomeAnimal"
FROM animais
WHERE "dtNascAnimal" < (
    SELECT "dtNascAnimal"
    FROM animais
    WHERE "nomeAnimal" = 'Salti'
);

