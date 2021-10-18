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
    REFERENCES funcionarios (idfuncionario)
);

CREATE TABLE IF NOT EXISTS filmes (
  idfilme INT NOT NULL,
  nomeFilme VARCHAR(100) NULL,
  classificacaoFilme ENUM("L, 10, 12, 14, 16 ,18") NULL,
  lancamentoFilme DATE NULL,
  PRIMARY KEY (idfilme)
);

  CREATE TABLE IF NOT EXISTS distribuidoras (
  nomeDistri VARCHAR(100) NOT NULL,
  cnpjDistri VARCHAR(14) NULL,
  enderecoDistri VARCHAR(100) NULL,
  idfilme INT NOT NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);

CREATE TABLE IF NOT EXISTS emprestimo (
  idCliente INT NOT NULL,
  dataPedido DATE NULL,
  idFilme INT NOT NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme),
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente)
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

INSERT INTO cliente VALUES
(1, "Luís Eduardo", "11111111111", "email@example.com", 22, "Samambaia Sul");

INSERT INTO telefone VALUES
(1, "61985456156", 1);

INSERT INTO funcionarios VALUES
(1, "Fábio");

INSERT INTO atende VALUES
(1, 1);

INSERT INTO pagamento VALUES
("PIX", 1, 1);

INSERT INTO filmes VALUES
(1, "The Mummy", "12", '18/06/1999');

INSERT INTO distribuidoras VALUES
("distribuidora de filme", "11111111111111", "Rua das Laranjeiras, Casa 20", 1);

INSERT INTO emprestimo VALUES
(1, '18-10-2021', 1);

INSERT INTO categoria VALUES
(1, 0, 0, 1, 0, 0, 0);

INSERT INTO atores VALUES
(1,"Brendan Fraser");

INSERT INTO traducao VALUES
(1, "A Mumia", 1);
