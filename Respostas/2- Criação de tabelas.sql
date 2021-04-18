CREATE TABLE Autor (
  Id   bigint IDENTITY(1, 1) NOT NULL, 
  Nome varchar(400) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Cliente (
  Cpf        varchar(11) NOT NULL, 
  Nome       varchar(255) NOT NULL, 
  Email      varchar(150) NOT NULL, 
  Nascimento date NOT NULL, 
  PRIMARY KEY (Cpf));

CREATE TABLE Editora (
  Id   bigint IDENTITY(1, 1) NOT NULL, 
  Nome varchar(100) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Funcionario (
  Id   bigint IDENTITY(1, 1) NOT NULL, 
  Nome varchar(100) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Genero (
  Id   bigint IDENTITY(1, 1) NOT NULL, 
  Nome varchar(60) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE ItemVenda (
  VendaId    bigint NOT NULL, 
  LivroId    bigint NOT NULL, 
  Quantidade int NOT NULL, 
  Valor      decimal(16, 2) NOT NULL, 
  PRIMARY KEY (VendaId, 
  LivroId));

CREATE TABLE Livro (
  Id             bigint IDENTITY(1, 1) NOT NULL, 
  GeneroId       bigint NOT NULL, 
  EditoraId      bigint NOT NULL, 
  Nome           varchar(300) NOT NULL, 
  Paginas        int NOT NULL, 
  Preco          decimal(16, 2) NOT NULL, 
  DataPublicacao date NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Livro_Autor (
  LivroId bigint NOT NULL, 
  AutorId bigint NOT NULL, 
  PRIMARY KEY (LivroId, 
  AutorId));

CREATE TABLE Telefone (
  ClienteCpf varchar(11) NOT NULL, 
  Numero     varchar(14) NOT NULL, 
  PRIMARY KEY (ClienteCpf, 
  Numero));

CREATE TABLE Venda (
  Id            bigint IDENTITY(1, 1) NOT NULL, 
  FuncionarioId bigint NOT NULL, 
  ClienteCpf    varchar(11) NOT NULL, 
  DataHora      datetime NOT NULL, 
  PRIMARY KEY (Id));

ALTER TABLE Venda ADD CONSTRAINT FKVenda_Funcionario FOREIGN KEY (FuncionarioId) REFERENCES Funcionario (Id);
ALTER TABLE Venda ADD CONSTRAINT FKVenda_Cliente FOREIGN KEY (ClienteCpf) REFERENCES Cliente (Cpf);

ALTER TABLE ItemVenda ADD CONSTRAINT FKItemVenda_Livro FOREIGN KEY (LivroId) REFERENCES Livro (Id);
ALTER TABLE ItemVenda ADD CONSTRAINT FKItemVenda_Venda FOREIGN KEY (VendaId) REFERENCES Venda (Id);

ALTER TABLE Telefone ADD CONSTRAINT FKTelefone_Cliente FOREIGN KEY (ClienteCpf) REFERENCES Cliente (Cpf);

ALTER TABLE Livro ADD CONSTRAINT FKLivro_Editora FOREIGN KEY (EditoraId) REFERENCES Editora (Id);
ALTER TABLE Livro ADD CONSTRAINT FKLivro_Genero FOREIGN KEY (GeneroId) REFERENCES Genero (Id);

ALTER TABLE Livro_Autor ADD CONSTRAINT FKLivro_Autor1 FOREIGN KEY (AutorId) REFERENCES Autor (Id);
ALTER TABLE Livro_Autor ADD CONSTRAINT FKLivro_Autor2 FOREIGN KEY (LivroId) REFERENCES Livro (Id);
