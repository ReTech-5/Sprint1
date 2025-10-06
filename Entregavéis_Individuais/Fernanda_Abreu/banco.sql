-- FERNANDA ABREU | RA:01252045
-- Projeto Pesquisa e Inovação - Sistema de monitoramento de lixeiras de grande porte
-- Entrega tabelas individuais


-- TABELA USUÁRIO/LOGIN
CREATE DATABASE Retech;
USE Retech;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(80) NOT NULL,
celular VARCHAR(15),
email VARCHAR(80) NOT NULL,
dtNasc DATE,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE TABLE usuario;

INSERT INTO usuario (nome, celular, email, dtNasc) VALUES
('Mayara Cristina Longuinho de França', '(11)94002-8922', 'mayara.franca@sptech.school', '2000-09-03'),
('Fernanda Gonçalo de Abreu', '(11)91234-5678', 'fernanda.abreu@sptech.school', '1998-07-21' ),
('Ronijamily de Souza Lima', '(11)97777-7777', 'ronijamily.lima@sptech.school', '2002-05-19' ),
('Samara de Silva Freitas Farias', '(11)9888-8888', 'samara.farias@sptech.school','2001-12-10' );

SELECT * FROM usuario;

SELECT nome, email FROM usuario;
    
SELECT * FROM usuario ORDER BY nome;

ALTER TABLE usuario ADD COLUMN senha CHAR(8) NOT NULL;

SELECT * FROM usuario;

UPDATE usuario SET senha = 'diana123'
	WHERE idUsuario = 1;
    
UPDATE usuario SET senha = 'asuna123'
	WHERE idUsuario = 2;

UPDATE usuario SET senha = 'mel12345'
	WHERE idUsuario = 3;

UPDATE usuario SET senha = 'lulu1234'
	WHERE idUsuario = 4;
    
ALTER TABLE usuario ADD COLUMN situação VARCHAR(10);

ALTER TABLE usuario ADD CONSTRAINT chkSituação
	CHECK (situação IN ('ativo', 'inativo'));
    
UPDATE usuario SET situação = 'ativo'
	WHERE idUsuario IN (1,3);
    
UPDATE usuario SET situação = 'inativo'
	WHERE idUsuario IN (2,4); 

SELECT * FROM usuario;

SELECT CONCAT('Seu login é: ' , email , ' e senha: ' , senha) AS 'Login Cadastro' 
FROM usuario ORDER BY nome;

INSERT INTO usuario (nome, cpf, celular, email, dtNasc, senha) VALUES 
	('Cauã Gama Paixão', '337.698.414-00', '(11)92222-2222', 'caua.paixao@sptech.school', '2000-02-27', 'elefante'),
	('Erick da Silva Victorino', '256.698.781-67', '(11)93333-3333', 'erick.victor@sptech.school', '1999-11-18', 'bob00000');
    
SELECT * FROM usuario;

DELETE FROM usuario
	WHERE idUsuario IN (2,4); 
    
    
    
-- TABELA ROTA DOS CAMINHÕES SEMANALMENTE
USE Retech;

CREATE TABLE RotaSemanal (
idRota INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(50),
bairro VARCHAR(50),
qtColetas INT,
qtProduzida FLOAT
);

DESCRIBE TABLE RotaSemanal;

INSERT INTO RotaSemanal (rua, bairro, qtColetas, qtProduzida) VALUES
	('Mar vermelho', 'Reginalice', 3, 420.00),
    ('Paraná', 'Boa vista', 1, 263.00),
    ('Tucunaré', 'Alphaville', 2, 290.00),
    ('Sagitário', 'Alphaville', 2, 312.00);
    
SELECT * FROM RotaSemanal;

SELECT CONCAT('A rua: ' , rua, ' produziu ' , qtProduzida, ' de lixo durante esta semana') AS 'Rua e Quantidade' 
FROM RotaSemanal ORDER BY rua;

SELECT * FROM RotaSemanal
	WHERE qtProduzida > 300.00;
    
ALTER TABLE RotaSemanal ADD COLUMN tipoLixo VARCHAR(20);

ALTER TABLE RotaSemanal ADD CONSTRAINT chktipoLixo
	CHECK(tipoLixo IN ('orgânico', 'reciclável'));
    
SELECT * FROM RotaSemanal;

UPDATE RotaSemanal SET tipoLixo = 'orgânico'
	WHERE idRota = 1;
    
UPDATE RotaSemanal SET tipoLixo = 'reciclável'
	WHERE idRota IN(3, 4);
    
UPDATE RotaSemanal SET tipoLixo = 'orgânico'
	WHERE idRota = 2;

SELECT * FROM RotaSemanal;

UPDATE RotaSemanal SET bairro =
	CASE
    WHEN bairro = 'Reginalice' THEN 'Jardim Reginalice'
    WHEN bairro = 'Boa vista' THEN 'Vila Boa vista'
    end 
    WHERE idRota IN (1, 2);
    
SELECT * FROM RotaSemanal
	WHERE bairro = 'alphaville';
    
    
-- TABELA SENSOR ULTRASSONICO RDUINO 
 
 USE ReTech;
 
 CREATE TABLE sensor (
 idSensor INT PRIMARY KEY AUTO_INCREMENT,
 distancia FLOAT, 
 dtMed DATETIME DEFAULT CURRENT_TIMESTAMP,
 nivel FLOAT
 );
 
 DESCRIBE sensor;
 
 INSERT INTO sensor (distancia, nivel) VALUES
	(300, 00.0),
    (150, 50.0),
    (0, 100.00);

SELECT * FROM sensor;

SELECT CONCAT('A distância entre o sensor e o fundo da lixeira atualmente é de ', distancia , 'cm estando ', nivel , '% cheio') AS 'Nivel de Profundidade'
FROM sensor ORDER BY distancia DESC;

SELECT * FROM sensor 
	WHERE distancia < 300;
    
ALTER TABLE sensor ADD COLUMN limite VARCHAR(5);

DESCRIBE sensor;

ALTER TABLE sensor ADD CONSTRAINT chkLimite
	CHECK(limite IN('sim', 'não'));
    
UPDATE sensor SET limite = 'sim'
	WHERE idSensor = 3;

UPDATE sensor SET limite = 'não'
	WHERE idSensor IN (1,2);

SELECT * FROM sensor;

SELECT limite AS 'Lixeira Atingiu o limite?' FROM sensor;

DELETE FROM sensor
	WHERE idSensor = 1;
    


    
