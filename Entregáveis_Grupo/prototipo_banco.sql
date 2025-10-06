/*
GRUPO 5git 
 CAUÃ GAMA PAIXÃO, 
 ERICK VICTORINO,
 FERNANDA GONÇALO, 
 MAYARA LONGUINHO,
 PEDRO VIEIRA,
 SAMARA FARIAS,
 RONIJAMILLY LIMA
*/

-- Comentario Gleison: O script desse banco de dados carece de um padrão de desenvolvimento

CREATE DATABASE Retech;

USE Retech;

-- TABELA USUARIO:
-- Comentario Gleison: A tabela usuario deve ser remodelada para se alinhar com a regra de negocio

CREATE TABLE Usuario (
IdUsuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL,
Contato VARCHAR (20) NOT NULL,
Senha CHAR(8) NOT NULL,
DtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Usuario (Nome, Email, Contato, Senha) VALUES
('Mayara Cristina Longuinho de França', 'mayara.franca@sptech.school', '(11)94002-8922', 'Diana123'),
('Fernanda Gonçalo de Abreu', 'fernanda.abreu@sptech.school', '(11)91234-5678','Asuna123'),
('Ronijamily de Souza Lima', 'ronijamily.lima@sptech.school', '(11)97777-7777','Snopy123'),
('Samara de Silva Freitas Farias', 'samara.farias@sptech.school', '(11)9888-8888','Luna1234');

SELECT * FROM Usuario;

SELECT IdUsuario, nome, contato FROM Usuario;

SELECT email, senha FROM Usuario;

SELECT * FROM Usuario 
	WHERE nome = 'Mayara Cristina Longuinho de França';

SELECT * FROM Usuario 
	WHERE nome LIKE 'S%';


SELECT * FROM Usuario
	WHERE nome LIKE '%u';


SELECT nome FROM Usuario
	WHERE nome LIKE '%a%';


SELECT * FROM Usuario
	WHERE nome LIKE '_o%';


SELECT * FROM Usuario
	WHERE nome LIKE '%a_';
    
SELECT * FROM Usuario
	WHERE nome != 'Mayara Cristina Longuinho de França';
    
SELECT * FROM Usuario
	WHERE nome <> 'Fernanda';
    

SELECT * FROM Usuario ORDER BY nome;

SELECT * FROM Usuario ORDER BY nome DESC;

SHOW TABLES;

SELECT * FROM Usuario;

INSERT INTO Usuario (nome, email, contato, senha) VALUES
	('Cauã Gama Paixão', 'caua.paixao@sptech.school', '(11)92222-2222','cauan123'),
	('Erick da Silva Victorino', 'erick.victor@sptech.school', '(11)93333-3333','erick123');

UPDATE Usuario SET email = 'erick.victorino@sptech.school'
	WHERE IdUsuario = '22';

SELECT * FROM Usuario;

INSERT INTO Usuario (nome, email, contato, senha, TipoUsuario) VALUES
	('Pedro Henrique Cardoso Vieira', 'pedro.cvieira@sptech.school', '(11)94444-4444','pedro321', 'Cliente');

SELECT * FROM usuario;


ALTER TABLE Usuario RENAME COLUMN DtCadastro TO DtLogin;


ALTER TABLE Usuario MODIFY COLUMN email VARCHAR(90);


ALTER TABLE Usuario ADD COLUMN TipoUsuario CHAR(7);


ALTER TABLE Usuario ADD CONSTRAINT chkTipoUsuario
	CHECK(TipoUsuario = 'Cliente' OR TipoUsuario = 'Empresa');
    
SELECT * FROM Usuario;

TRUNCATE TABLE Usuario;

SELECT nome AS Cliente FROM Usuario;

SELECT nome as Cliente,
	Contato as 'Telefone',
	Email as 'Contato',
    Senha as 'Caracteres',
    DtLogin as 'DtCadastro'
    FROM Usuario;


SELECT CONCAT(nome, email) FROM Usuario;

SELECT CONCAT(nome, ' ', email) FROM Usuario;

SELECT CONCAT(nome, ' ', contato, ' ', email) as 'Cliente e contatos'
	FROM Usuario;
    
SELECT CONCAT('O cliente ', nome, 
' prefere contato via ', email, '!')
	as 'Cliente e contatos'
		FROM Usuario;


SELECT nome, 
	CASE
    WHEN TipoUsuario = 'Cliente' THEN 'Tipo Definido para cliente'
    ELSE 'Empresa'
    END AS 'Tipo definido para empresa'
    FROM Usuario;

-- TABELA ARDUINO:  
-- Comentario Gleison: A tabela do arduino necessita de campos essenciais

CREATE TABLE DadosArduino ( 
idLixeira INT PRIMARY KEY AUTO_INCREMENT, 
Profundidade DECIMAL (5, 2), 
DataMedicao DATETIME  DEFAULT CURRENT_TIMESTAMP 
);

DESC DadosArduino;

INSERT INTO DadosArduino (Profundidade) VALUES 
(200.00),
(173.50),
(215.32);
  
SELECT * FROM DadosArduino;

ALTER TABLE DadosArduino ADD COLUMN Limite CHAR (3);
ALTER TABLE DadosArduino ADD CONSTRAINT chkLimite 
CHECK (Limite = 'Sim' OR Limite = 'Não');

INSERT INTO DadosArduino (Profundidade, Limite) VALUES 
(142.80, 'Não');

UPDATE DadosArduino SET Limite = 'Não' 
WHERE idLixeira = 1;

UPDATE DadosArduino SET Limite = 'Não' 
WHERE idLixeira = 2;

SELECT * FROM DadosArduino;

UPDATE DadosArduino SET Profundidade = 300 
	WHERE idLixeira = 1;

SELECT CONCAT('A profundidade é de ', Profundidade, ' em ', DataMedicao) AS 'Profundidade (cm)', 
Limite AS 'Antigiu o Limite?' FROM DadosArduino;


-- TABELA REGIAO: 
-- Comentario Gleison: Não entendi essa tabela direito

CREATE TABLE Regiao ( 
idRegiao INT PRIMARY KEY AUTO_INCREMENT, 
nomeBAIRRO VARCHAR (50), 
qtdPRODUZIDA DECIMAL (5,2), 
tipoREGIAO VARCHAR (40) 
CONSTRAINT chkRegiao 
CHECK (tipoREGIAO IN ('Residencial', 'Lazer', 'Turística', 'Industrial', 'Comercial' )), 
horaCOLETA TIME 
);

DESC Regiao;


INSERT INTO Regiao VALUES 

(default, 'Centro', '290.00', 'Comercial', '18:00:00'), 
(default, 'Jardim Esplanada', '180.00', 'Residencial', '13:30:00'), 
(default, 'Vila Suíça', '227.50', 'Industrial', '12:30:00'), 
(default, 'Cidade Nova', '98.35', 'Turística', '08:30:00');

SELECT * FROM Regiao;

SELECT nomeBAIRRO AS 'Nome do Bairro', 
qtdPRODUZIDA AS 'Quantidade de lixo produzida (cm)', 
tipoREGIAO AS 'Classificação da região', 
horaCOLETA AS 'Horário da coleta' FROM Regiao 
ORDER BY qtdPRODUZIDA DESC;

-- Comentario Gleison: --
/*

As tabelas existentes necessitam de uma atualização para se adequarem ao modelo de negócio. 
Necessitamos também de algumas novas tabelas essenciais para o projeto, como uma tabela para armazenar
as informações dos sensores.

*/
 
