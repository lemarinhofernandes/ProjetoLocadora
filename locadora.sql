drop database if exists locadora ;

create database if not exists locadora 
default character set utf8mb4;

use locadora;
	
CREATE TABLE IF NOT EXISTS cliente (
  idCliente INT NOT NULL,
  nomeCli VARCHAR(100) NULL,
  cpfCLi VARCHAR(11) NULL,
  emailCli VARCHAR(100) NULL,
  idadeCli INT NULL,
  enderecoCLi VARCHAR(100) NULL,
  PRIMARY KEY (idCliente)
  );


CREATE TABLE IF NOT EXISTS telefone (
  idtelefone INT NOT NULL,
  numero VARCHAR(11) NOT NULL,
  idCliente INT NOT NULL,
  telefonecol VARCHAR(45) NULL,
  PRIMARY KEY (idtelefone),
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente)
);


CREATE TABLE IF NOT EXISTS funcionarios (
  idfuncionario INT NOT NULL,
  nomeFun VARCHAR(100) NOT NULL,
  PRIMARY KEY (idfuncionario)
  );


CREATE TABLE IF NOT EXISTS atende (
  idCliente INT NOT NULL,
  idFuncionario INT NOT NULL,
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente),
  FOREIGN KEY (idFuncionario)
    REFERENCES funcionarios (idfuncionario)
);


CREATE TABLE IF NOT EXISTS pagamento (
  tipoPagamento ENUM('PIX', 'DEB', 'CRED') NOT NULL,
  idCliente INT NOT NULL,
  idFuncionario INT NOT NULL,
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente),
  FOREIGN KEY (idFuncionario)
    REFERENCES funcionario (idfuncionario)
);


CREATE TABLE IF NOT EXISTS filmes (
  idfilme INT NOT NULL,
  nomeFilme VARCHAR(100) NULL,
  classificacaoFilme INT NULL,
  lancamentoFilme DATE NULL,
  PRIMARY KEY (idfilme)
);


CREATE TABLE IF NOT EXISTS emprestimo (
  idCliente INT NOT NULL,
  dataPedido DATE NULL,
  idFilme INT NOT NULL,
  emprestimocol VARCHAR(45) NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme),
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente)
);


CREATE TABLE IF NOT EXISTS distribuidoras (
  nomeDistri VARCHAR(100) NOT NULL,
  cnpjDistri VARCHAR(14) NULL,
  enderecoDistri VARCHAR(100) NULL,
  filmes_idfilme INT NOT NULL,
    FOREIGN KEY (filmes_idfilme)
    REFERENCES filmes (idfilme)
);


CREATE TABLE IF NOT EXISTS categoria (
  idFilme INT NOT NULL,
  suspense TINYINT(1),
  terror TINYINT(1),
  acao TINYINT(1),
  ficcao TINYINT(1),
  comedia TINYINT(1),
  romance TINYINT(1),
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);


CREATE TABLE IF NOT EXISTS atores (
  idFilme INT NOT NULL,
  nomeAtor VARCHAR(100) NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);


CREATE TABLE IF NOT EXISTS diretor (
  idFilme INT NOT NULL,
  nomeDiretor VARCHAR(100) NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);


CREATE TABLE IF NOT EXISTS traducao (
  idtraducao INT NOT NULL,
  nomeTraduzido VARCHAR(100) NULL,
  idFilme INT NOT NULL,
  PRIMARY KEY (idtraducao),
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);
