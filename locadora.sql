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
  classificacaoFilme ENUM("L", "10", "12", "14", "16" ,"18") NULL,
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
  dataDevolucao DATE NULL,
  idFilme INT NOT NULL,
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme),
  FOREIGN KEY (idCliente)
    REFERENCES cliente (idCliente)
);

CREATE TABLE IF NOT EXISTS categoria (
  idFilme INT NOT NULL,
  categoria ENUM("suspense", "terror", "acao", "ficcao", "comedia", "romance") not null,
  /*
  suspense TINYINT(1),
  terror TINYINT(1),
  acao TINYINT(1),
  ficcao TINYINT(1),
  comedia TINYINT(1),
  romance TINYINT(1),
  */
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
  /*idtraducao INT NOT NULL,*/
  nomeTraduzido VARCHAR(100) NULL,
  idFilme INT NOT NULL,
  /*PRIMARY KEY (idtraducao),*/
  FOREIGN KEY (idFilme)
    REFERENCES filmes (idfilme)
);

INSERT INTO cliente VALUES
(1, "Luís Eduardo", "11111111111", "luis.eduardo@email.com", 22, "CNB 13"),
(2, "Daniel S. Ribeiro", "22222222222", "daniel.ribeiro@gmail.com", 23, "QNA 02"),
(3, "Sara Jessica", "33333333333", "sara.jessica@gmail.com", 41, "QNG 10"),
(4, "Juliana Siqueira", "44444444444", "juliana@gmail.com", 19, "QNE 27");

INSERT INTO telefone VALUES
(1, "61985456156", 1),
(2, "61989999999", 2),
(3, "61984521231", 3),
(4, "61454123145", 4);

INSERT INTO funcionarios VALUES
(1, "Fábio"),
(2, "João");

INSERT INTO atende VALUES
(1, 1),
(2,1),
(3,2),
(4,1);

INSERT INTO pagamento VALUES
("PIX", 1, 1),
("CRED", 2, 1),
("CRED", 3, 2),
("DEB", 4, 1);

INSERT INTO filmes VALUES
(1, "The Mummy", "12", '1999/06/18'),
(2, "Butterfly Effect", "14", '2004/07/23'),
(3, "Donnie Darko", "14", '2001/01/19'),
(4, "The Hateful Eight", "18", "2016/01/07");

INSERT INTO distribuidoras VALUES
("Paris Entertainment", "11111111111111", "Rua das Laranjeiras, Casa 20", 1),
("Paris Entertainment", "11111111111111", "Rua das Laranjeiras, Casa 20", 2),
("Paris Entertainment", "11111111111111", "Rua das Laranjeiras, Casa 20", 3),
("DF Filmes", "22222222222", "SQS 300", 4);

INSERT INTO emprestimo VALUES
(1, '2021/10/18', '2021/10/25', 1),
(2, '2021/10/10', '2021/10/17', 2),
(3, '2021/07/06', '2021/07/13', 2),
(4, '2021/10/18', '2021/10/25', 4);

INSERT INTO categoria VALUES
(1, "acao"),
(2, "ficcao"),
(3, "ficcao");

INSERT INTO atores VALUES
(1,"Brendan Fraser"),
(2, "Ashton Kutcher"),
(3, "Jake Gyllenhaal"),
(4, "Samuel L. Jackson");

INSERT INTO traducao VALUES
("A Mumia", 1),
("Efeito Borboleta", 2),
("Donnie Darko", 3),
("Os Oito Odiados", 4);


/* selects */

SELECT nomeCli, idadeCli, enderecoCLi, emailCli FROM locadora.cliente
ORDER BY nomeCli;
SELECT * FROM locadora.filmes;

SELECT * FROM locadora.telefome;

SELECT * FROM locadora.funcionarios;

SELECT * FROM locadora.atende;

SELECT * FROM locadora.pagamento;

SELECT * FROM locadora.distribuidoras;

SELECT * FROM locadora.emprestimo;

SELECT * FROM locadora.categoria;

SELECT * FROM locadora.atores;

SELECT * FROM locadora.tradução;