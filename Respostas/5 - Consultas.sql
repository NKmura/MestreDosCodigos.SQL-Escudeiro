--5 - Realize 5 consultas no modelo de dados criado no exercício 1, realizando pelo menos uma das seguintes operações: 
--Union, Intersect, Minus, e utilizando pelo menos 3 tipos diferentes de joins;

--R1: CPFs de clientes que fizeram compras no qual o nome começa com José;
SELECT 
V.ClienteCpf
FROM Venda V
INTERSECT 
SELECT 
C.Cpf
FROM Cliente C  
WHERE C.Nome LIKE 'José%';

--R2: Ids de Livros não vendidos (MINUS)
SELECT L.Id
FROM Livro L
EXCEPT 
SELECT  IV.LivroId
FROM ItemVenda IV

--R3: consulta de livros vendidos em janeiro de 2020 ou que sejam do gênero de ficção fantástica
select distinct LV.*
from 
(SELECT
    L.Nome
FROM Venda V
INNER JOIN ItemVenda IV ON IV.VendaId = V.Id
INNER JOIN  Livro L ON L.Id = IV.LivroId
where
    V.DataHora BETWEEN '2020-01-01' and '2020-01-31'
UNION 
SELECT 
    L.Nome
FROM Livro L
INNER JOIN Genero  G ON G.Id = L.GeneroId
WHERE
    g.Nome = 'Ficção Fantástica') LV;

--R4: Livros com mais de um autor que não sejam publicados pela editora Aleph
select 
    LA.LivroId,
    L.Nome
from Livro L
inner join Livro_Autor LA on LA.LivroId = L.Id
group by LA.LivroId, L.Nome
having count(1)>1
EXCEPT
SELECT
    L.Id,
    L.Nome
from Livro L
inner join Editora E on E.Id = L.EditoraId
WHERE
    E.Nome = 'Aleph'

--R5: lista de editorasxlivros com vendas
SELECT
E.Nome Editora,
L.Nome Livro,
G.Nome Genero,
Vl.ValorVendido,
VL.QuantidadeVendida
from Livro L
inner join Genero G on G.Id = L.GeneroId
full outer join Editora E on E.Id = L.EditoraId
left OUTER join (
    select 
    IV.LivroId,
    Sum(IV.Quantidade) QuantidadeVendida,
    Sum(IV.Valor) ValorVendido
    from ItemVenda IV 
    group by IV.LivroId 
) VL on VL.LivroId = L.Id