--3 - Extrair um relatório do modelo de dados criado no exercício 1, utilizando 3 funções de agregação diferentes, e filtrando por pelo menos uma função agregadora;
--R: Relatório de venda de livros por editora mostrando o valor total, quantidade e valor médio de vendas de todas editoras que possuiem ao menos 10 livros vendidos.
SELECT
E.Id EditoraId,
E.Nome NomeEditora,
Sum(IV.Valor) VlrLivrosVendidos,
Sum(IV.Quantidade) QtdeLivrosVendidos,
AVG(IV.Valor) VlrMedioVendas

from Venda V
inner join ItemVenda IV on IV.VendaId = V.Id
inner join Livro L on L.Id = IV.LivroId
inner join Editora E on E.Id = L.Id
group by E.Id, E.Nome
having count(1) > 10
