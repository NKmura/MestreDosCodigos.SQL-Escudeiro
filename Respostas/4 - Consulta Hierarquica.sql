--4 - Criar uma query hierárquica, ordenando os registros por uma coluna específica;

-- Para a tabela abaixo segue aconsulta recursiva para escrever toda a hierarquia de registros
-- CREATE TABLE Empregado (
--   Id         bigint IDENTITY(1, 1) NOT NULL, 
--   SuperiorId bigint NULL, 
--   Nome       varchar(300) NOT NULL, 
--   PRIMARY KEY (Id));
-- ALTER TABLE Empregado ADD CONSTRAINT FKEmpregado1 FOREIGN KEY (SuperiorId) REFERENCES Empregado (Id);


with CTE_Hierarquia as 
(
   SELECT
        E.Id,
        E.superiorId,
        Convert(varchar(1000), E.nome) as Nome,
        0 as Nivel
    from Empregado E
    where E.superiorId is null

    UNION ALL 
    
        SELECT
            E2.Id,
            E2.superiorId,
            convert(varchar(1000), H.Nome + ' -> ' + E2.Nome) as Nome,
            H.Nivel+1 as Nivel
        from Empregado E2
        inner join  CTE_Hierarquia  H on H.Id = E2.superiorId
)

select * 
from CTE_Hierarquia
order by Nome