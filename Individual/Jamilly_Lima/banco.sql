-- Ronijmailly de Souza Lima 01252117
-- 1. Tabela Usuário
CREATE DATABASE ReTech;

USE Retech;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL, 
Email VARCHAR(100) NOT NULL,
Contato VARCHAR(20) NOT NULL,
Senha CHAR(8) NOT NULL,
dtCadastro DATETIME DEFAULT current_timestamp
);

DESC Usuario;

INSERT INTO Usuario (idUsuario, Nome, Email, Contato, Senha) VALUES
	(default, 'Mayara Cristina Longuinho de França', 'mayara.frança@sptech.school', '1194002-8922', 'diana123'),
	(default, 'Fernanda Gonçalo de Abreu', 'fernanda.abreu@sptech.school', '1194002-8948', 'asuna123'),
	(default, 'Samara da Silva Freitas Farias', 'samara.farias@sptech.school', '1198575-8447', 'luna1234'),
	(default, 'Ronijamilly de Souza Lima', 'ronijamilly.lima@sptech.school', '1194002-1234', 'snoopy12');
    
SELECT * FROM Usuario;

SELECT * FROM Usuario ORDER BY Nome;

SELECT 
	CONCAT('Seu usuário é ', Email, ' ', 'e sua senha é ', Senha) AS 'Login' FROM Usuario;
    
SELECT nome FROM Usuario
	WHERE nome LIKE '%s%';
    
ALTER TABLE Usuario RENAME COLUMN Nome TO NomeCompleto;

INSERT INTO Usuario (NomeCompleto, Email, Contato, Senha) VALUES
	('Pedro Henrique Cardoso Vieira', 'pedro.cvieira@sptech.school', '(11)94444-4444','pedro321');
    
UPDATE Usuario SET Email = 'pedro.vieira@sptech.school'
	WHERE idUsuario= 5;

ALTER TABLE Usuario ADD COLUMN TipoAcesso VARCHAR (20)
	CONSTRAINT chkTipoAcesso
		CHECK (TipoAcesso IN ('Administrador', 'Funcionário'));
        
DESCRIBE Usuario;

INSERT INTO Usuario (NomeCompleto, Email, Contato, Senha, TipoAcesso) VALUES
	('Cauã Gama Paixão', 'caua.paixao@sptech.school', '(11)92222-2222','cauan123', 'Administrador'),
	('Erick da Silva Victorino', 'erick.victor@sptech.school', '(11)93333-3333','erick123', 'Funcionário');
    
SELECT * FROM Usuario;

SELECT Contato AS 'Celular' FROM Usuario;

ALTER TABLE Usuario MODIFY COLUMN Email VARCHAR(50);

DESC Usuario;

SELECT CONCAT(NomeCompleto, ' prefere contato via email ', Email, '!') AS 'Forma de contato' FROM Usuario;

-- 2. Tabela Sensor

USE retech;

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
centimetros DECIMAL (5,2),
hora DATETIME DEFAULT CURRENT_TIMESTAMP );

DESC Sensor;

INSERT INTO Sensor (centimetros) VALUES 
	(24.5);
    
SELECT * FROM Sensor;

INSERT INTO Sensor (centimetros) VALUES
	(200.5),
	(250.5),
	(300.0);
    
SELECT * FROM Sensor;

SELECT CONCAT('No horário ', hora, ' o acúmulo de resíduos marcou ', centimetros, 'cm') AS 'Nível do Lixo' FROM Sensor; 

ALTER TABLE Sensor RENAME COLUMN centimetros TO profundidade;

ALTER TABLE Sensor ADD COLUMN alerta VARCHAR(20);

UPDATE Sensor SET alerta = 'amarelo'
	WHERE idSensor = 1;
    
UPDATE Sensor SET alerta = 'vermelho'
	WHERE idSensor IN (2,3);

INSERT INTO Sensor (profundidade, alerta) VALUES
	(50.5, 'verde');
    
SELECT CONCAT('Quando a profundidade atingir ', profundidade, 'cm ', 'então ser enviado um alerta ', alerta) AS 'Alerta para o Setor de Coleta' 
FROM Sensor;

UPDATE Sensor SET alerta = 'verde'
	WHERE idSensor = 2;
  
UPDATE Sensor SET alerta = 'vermelho'
	WHERE idSensor = 4;
    
SELECT * FROM Sensor;

-- 3. Tabela Gastos

USE retech;

CREATE TABLE Gastos ( 
idGastos INT PRIMARY KEY AUTO_INCREMENT, 
custoEQUIPE DECIMAL (8,2), 
gastoCOMBUSTIVEL DECIMAL (8,2), 
mes INT 
);

DESC Gastos;

INSERT INTO Gastos (custoEQUIPE, gastoCOMBUSTIVEL, mes)  VALUES
	(165000.00, 26460.00, 5), 
	(132500.00, 29000.00, 7), 
	(95000.00, 22386.00, 4);
    
SELECT CONCAT(custoEQUIPE, ' e ', gastoCOMBUSTIVEL) AS 'Valores Mensais' FROM Gastos;

SELECT custoEQUIPE AS 'Gastos Mensais com Funcionários', 
gastoCOMBUSTIVEL AS 'Gastos Mensais com óleo diesel', 
mes AS 'Mês do cálculo financeiro' 
FROM Gastos;

SELECT CONCAT('No mês ', mes, ' o valor gasto a equipe de coleta foi ', custoEQUIPE, ' reais e o valor gasto com o combustível foi ', gastoCOMBUSTIVEL, ' reais') 
	AS 'Relatório de Custos' 
	FROM Gastos;
    
-- 4. Tabela Resíduos

USE retech;

CREATE TABLE Residuos(
idResiduos INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(20),
descricao VARCHAR(50));

INSERT INTO Residuos (tipo, descricao)VALUES
	('Orgânico', 'Separar no lixo da cor marrom'),
	('Plástico', 'Separar no lixo da cor vermelha'),
	('Papel', 'Separar no lixo da cor azul');
    
SELECT * FROM Residuos;

SELECT CONCAT('Quando o resíduo for ', tipo, ' então, ', descricao) AS 'Coleta Seletiva' FROM Residuos;
