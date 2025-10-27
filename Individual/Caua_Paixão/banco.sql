-- BANCO DE DADOS SPRINT 1
-- TABELA 1
USE retech;
CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (30) NOT NULL,
sobrenome VARCHAR (30) NOT NULL,
email VARCHAR(30) UNIQUE NOT NULL,
senha CHAR(10) UNIQUE NOT NULL,
dtnasc DATE,
cpf INT NOT NULL UNIQUE,
dtcadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO usuario (nome, sobrenome, email, senha, dtnasc, cpf) VALUES
	('Cauã', 'Paixão', 'cauagama296254@gmail.com', 'Ca29625428', '2007-02-19', '412.899.628-98'),
	('Solange', 'Gama', 'solgama56@gmail.com', 'sollua2962', '1965-05-18', '058.257.628-84'),
	('Leonardo', 'Silva', 'leosilva@outlook.com', 'leoSilva11', '2000-09-21', '327.551.989-02'),
	('Rafael', 'Peixoto', 'rafaazpeixoto@gmail.com', 'rafazP0808', '2006-08-08', '127.899.413-35');
ALTER TABLE usuario MODIFY COLUMN cpf VARCHAR (40) NOT NULL UNIQUE;
SELECT * FROM usuario;

ALTER TABLE usuario RENAME COLUMN dtcadastro TO HoraCadastro;

SELECT CONCAT (nome, ' ', sobrenome, ' realizou o cadastro em', ' ', HoraCadastro) 
	AS 'Efetuação do Cadastro' FROM usuario;
    
SELECT nome, sobrenome,
CASE
WHEN dtnasc >= '2006-01-01' THEN 'Jovem cadastrado'
ELSE  'Adulto cadastrado'
END AS 'Jovens cadastrados' FROM usuario;

SELECT nome AS 'Nome do Usuário',
	sobrenome AS 'Sobrenome do Usuário',
    email AS 'Seu e-mail',
    senha AS 'Sua senha (10 dígitos)',
    dtnasc AS 'Data de Nascimento',
    cpf AS 'Seu CPF',
    HoraCadastro AS 'Momento do Cadastro' FROM usuario;

-- TABELA 2
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR (40) NOT NULL,
cnpj VARCHAR (40) NOT NULL,
telefone VARCHAR (30),
responsavel VARCHAR (50),
email VARCHAR(40),
horaCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESC empresa;

INSERT INTO empresa (nomeEmpresa, cnpj, telefone, responsavel, email) VALUES
	('Prefeitura Indaiatuba', '34.556.2890075-09', '(19)90901-2675', 'Fernando Abreu', 'fernando.abreu@outlook.com'),
	('Prefeitura São Paulo', '67.787.0945008-05', '(11)94345-8167', 'Samantha Leal', 'sah.leal@outlook.com'),
	('Prefeitura Jundiai', '07.142.6540005-13', '(11)97675-3441', 'Luis Simões', 'luissimoes@gmail.com');
    
SELECT * FROM empresa;

UPDATE empresa SET email = 'prefIndaiatuba.sp@outlook.com'
	WHERE idEmpresa = 1;
    
ALTER TABLE empresa RENAME COLUMN telefone TO TelefoneContato;

DESC empresa;
SELECT nomeEmpresa AS 'Empresa', cnpj AS 'CNPJ (Empresa)',
	CASE 
    WHEN nomeEmpresa LIKE 'Prefeitura %' THEN 'Órgão governamental'
    END AS 'Governo' FROM empresa;
    
SELECT * FROM empresa 
	ORDER BY responsavel;


-- TABELA 3

CREATE TABLE DadosArduino (
idLixeira INT PRIMARY KEY AUTO_INCREMENT,
Profundidade DECIMAL (5, 2),
DataMedicao DATETIME  DEFAULT CURRENT_TIMESTAMP
);
 DESC DadosArduino;
 INSERT INTO DadosArduino (Profundidade) VALUES
 (200.00);
 
 SELECT * FROM DadosArduino;
 
 INSERT INTO DadosArduino (Profundidade) VALUES
 (173.50);
 
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
 
 
 -- TABELA 4
 
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
    
-- TABELA 5

CREATE TABLE financeiro (
idgastos INT PRIMARY KEY AUTO_INCREMENT,
custoEQUIPE DECIMAL (8, 2),
gastoCOMBUSTIVEL DECIMAL (8, 2),
qtdviagens INT,
qtdCOLETADO INT
);

INSERT INTO financeiro VALUES
	(default, '165000.00', '4500.00', 32,  3000),
	(default, '132500.00', '2900.00', 21, 2600),
	(default, '95000.00', '2238.00', 43, 6800);

SELECT * FROM financeiro;

SELECT custoEQUIPE AS 'Gastos com Funcionários(mês)',
	gastoCOMBUSTIVEL AS 'Gastos com óleo diesel(mês)',
    qtdviagens AS 'Quantidade de viagens (mês)',
    qtdCOLETADO AS 'Média de Lixo coletado (ton) / mês' FROM financeiro;


     
    




    