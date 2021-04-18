CREATE TABLE Estado (
  Id    bigint IDENTITY(1, 1) NOT NULL, 
  Nome  varchar(100) NOT NULL, 
  Sigla varchar(2) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Cidade (
  Id        bigint IDENTITY(1, 1) NOT NULL, 
  EstadoId  bigint NOT NULL, 
  Nome      varchar(300) NOT NULL, 
  Gentilico varchar(100) NOT NULL, 
  PRIMARY KEY (Id));

CREATE TABLE Bairro (
  Id       bigint IDENTITY(1, 1) NOT NULL, 
  CidadeId bigint NOT NULL, 
  Nome     varchar(300) NOT NULL, 
  PRIMARY KEY (Id));
    
CREATE TABLE Logradouro (
  Id       bigint IDENTITY(1, 1) NOT NULL, 
  CidadeId bigint NOT NULL, 
  BairroId bigint NULL, 
  Nome     varchar(300) NOT NULL, 
  PRIMARY KEY (Id));
	
CREATE TABLE Endereco (
  Id           bigint IDENTITY(1, 1) NOT NULL, 
  LogradouroId bigint NOT NULL, 
  Numero       int NOT NULL, 
  PRIMARY KEY (Id));
  
CREATE TABLE Endereco_Cliente (
  EnderecoId bigint NOT NULL, 
  Cliente_Id bigint NOT NULL, 
  PRIMARY KEY (EnderecoId, 
  ClienteId));
  
CREATE TABLE Endereco_Fornecedor (
  EnderecoId    bigint NOT NULL, 
  Fornecedor_Id bigint NOT NULL, 
  PRIMARY KEY (EnderecoId, 
  FornecedorId));
  
CREATE TABLE Endereco_Funcionario (
  EnderecoId     bigint NOT NULL, 
  Funcionario_Id bigint NOT NULL, 
  PRIMARY KEY (EnderecoId, 
  FuncionarioId));
  
CREATE TABLE Endereco_Usuario (
  EnderecoId bigint NOT NULL, 
  Usuario_Id bigint NOT NULL, 
  PRIMARY KEY (EnderecoId, 
  UsuarioId));

ALTER TABLE Cidade ADD CONSTRAINT FKCidade_Estado FOREIGN KEY (EstadoId) REFERENCES Estado(Id);
ALTER TABLE Bairro ADD CONSTRAINT FKBairro_Cidade FOREIGN KEY (CidadeId) REFERENCES Cidade(Id);
ALTER TABLE Logradouro ADD CONSTRAINT FKLogradouro_Bairro FOREIGN KEY (BairroId) REFERENCES Bairro(Id);
ALTER TABLE Logradouro ADD CONSTRAINT FKLogradouro_Cidade FOREIGN KEY (CidadeId) REFERENCES Cidade(Id);
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco_Logradouro FOREIGN KEY (LogradouroId) REFERENCES Logradouro(Id);

ALTER TABLE Endereco_Cliente ADD CONSTRAINT FKEndereco_Cliente1 FOREIGN KEY (EnderecoId) REFERENCES Endereco(Id);
ALTER TABLE Endereco_Cliente ADD CONSTRAINT FKEndereco_Cliente2 FOREIGN KEY (ClienteId) REFERENCES Cliente(Id);
   
ALTER TABLE Endereco_Usuario ADD CONSTRAINT FKEndereco_Usuario1 FOREIGN KEY (EnderecoId) REFERENCES Endereco(Id);
ALTER TABLE Endereco_Usuario ADD CONSTRAINT FKEndereco_Usuario2 FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id);

ALTER TABLE Endereco_Fornecedor ADD CONSTRAINT FKEndereco_Fornecedor1 FOREIGN KEY (EnderecoId) REFERENCES Endereco(Id);
ALTER TABLE Endereco_Fornecedor ADD CONSTRAINT FKEndereco_Fornecedor2 FOREIGN KEY (FornecedorId) REFERENCES Fornecedor(Id);

ALTER TABLE Endereco_Funcionario ADD CONSTRAINT FKEndereco_Funcionario1 FOREIGN KEY (EnderecoId) REFERENCES Endereco(Id);
ALTER TABLE Endereco_Funcionario ADD CONSTRAINT FKEndereco_Funcionario2 FOREIGN KEY (FuncionarioId) REFERENCES Funcionario(Id);

