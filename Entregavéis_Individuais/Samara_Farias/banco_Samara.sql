CREATE DATABASE ReTech_samara;
USE ReTech_samara;

CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(10),
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT current_timestamp
);

INSERT INTO usuario (nome, email, telefone, senha) VALUES
('Mayara Cristina Longuinho de França', 'Mayara.Franca@sptech.school', '11940028922', 'Diana123'),
('Fernanda Gonçalo De Abreu', 'Fernanda.Abreu@sptech.school', '1199999999', 'Asuna123'),
('Samara da Silva Freitas Farias', 'Samara.Farias@sptech.school', '14578924499', 'Luna1234'),
('Ronijamilly de Souza Lima', 'Ronijamilly.Lima@sptech.school', '15464515765', 'Snoopy12');

SELECT * FROM usuario;

INSERT INTO usuario (nome, email, telefone, senha) VALUES
('Pedro Henrique Cardoso Vieira', 'pedro.vieira@sptech.school', '14578584599', '294110'),
('Rafael Calderon', 'Rafinha@sptech.school','12354678985', '101006'),
('Cauã Paixão','caua.paixao@sptech.school', '145665468645', 'Lina458');

SELECT * FROM usuario;

UPDATE usuario SET email = 'pedro.cardoso@sptech.school' WHERE idUsuario = 5;
UPDATE usuario SET email = 'RafinhaPrazeres@sptech.school' WHERE idUsuario = 6;

ALTER TABLE usuario RENAME COLUMN telefone TO celular;

ALTER TABLE usuario MODIFY senha VARCHAR(20);

DELETE FROM usuario WHERE idUsuario = 7;

UPDATE usuario SET senha = 'NovaSenha123' WHERE nome = 'Pedro Henrique Cardoso Vieira';

ALTER TABLE usuario 
ADD CONSTRAINT chk_status CHECK (status_conta IN ('Ativo', 'Inativo', 'Pendente'));

UPDATE usuario SET status_conta = 'Inativo' WHERE idUsuario = 3;

UPDATE usuario SET status_conta = 'Pendente' WHERE idUsuario = 5;

ALTER TABLE usuario ADD COLUMN data_nascimento DATE;

ALTER TABLE usuario DROP COLUMN data_nascimento;

ALTER TABLE usuario CHANGE COLUMN status_conta situacao VARCHAR(30);

CREATE TABLE lixeira (
    idLixeira INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    data_instalacao DATE DEFAULT CURRENT_DATE
);

INSERT INTO lixeira (localizacao, capacidade, cidade)
VALUES ('Praça Central', 2000, 'Ribeirão Preto'),
       ('Avenida Paulista', 3000, 'São Paulo'),
       ('Praça da Matriz', 1500, 'Indaiatuba');
       
SELECT * FROM lixeira;

SELECT * FROM lixeira WHERE cidade = 'Ribeirão Preto';

SELECT localizacao, capacidade FROM lixeira;

UPDATE lixeira
SET capacidade = 2500
WHERE idLixeira = 1;

UPDATE lixeira
SET cidade = 'Campinas'
WHERE idLixeira = 3;

DELETE FROM lixeira
WHERE idLixeira = 2;

SELECT * FROM lixeira
ORDER BY capacidade DESC;



CREATE TABLE arduino (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    idLixeira INT,
    nivel_residuo INT NOT NULL, 
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idLixeira) REFERENCES lixeira(idLixeira)
);

INSERT INTO arduino (idLixeira, nivel_residuo)
VALUES (1, 65),  -- Lixeira 1 está 65% cheia
       (2, 80),  -- Lixeira 2 está 80% cheia
       (1, 90);  -- Nova leitura da Lixeira 1
       
SELECT * FROM arduino;

SELECT idLixeira, nivel_residuo, data_hora
FROM arduino
ORDER BY data_hora DESC;