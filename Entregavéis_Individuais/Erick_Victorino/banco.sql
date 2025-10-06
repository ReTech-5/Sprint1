
CREATE DATABASE Retech;

USE Retech;

-- rota dos caminhoes:

CREATE TABLE rota (
IdResponsavel INT PRIMARY KEY AUTO_INCREMENT,
responsavel VARCHAR(35) NOT NULL,
rua VARCHAR(35) NOT NULL,
bairro VARCHAR(30) NOT NULL,
ultimaColeta  DATETIME DEFAULT CURRENT_TIMESTAMP,
 lotacao VARCHAR(6) NOT NULL
);


ALTER TABLE rota ADD CONSTRAINT chkLotacao 
	CHECK (lotacao IN ('vazia', 'media', 'cheia'));


INSERT INTO rota (responsavel, rua, bairro, ultimaColeta,lotacao) VALUES
('ryan ferreira dos santos','hadock lobo', 'jardim paulista','2025-08-01','media'),
('Fernanda Gonçalo de Abreu','itatinga','sumare','2025-07-29','cheia'),
('erick da silva victorino','ken sugaya','jardim brasil', '2025-08-03','vazia'),
('Samara de Silva Freitas Farias','tres irmaos','guaianazes','2025-07-30','media');

SELECT * FROM rota;

SELECT rua, bairro, lotacao FROM rota;

SELECT responsavel FROM rota;

SELECT * FROM rota 
	WHERE responsavel = 'ryan ferreira dos santos';

ALTER TABLE rota MODIFY COLUMN responsavel VARCHAR(50);
    
SELECT bairro AS 'bairro da lixeira'  FROM rota;

SELECT responsavel as 'Cliente',
	rua as 'rua',
	bairro as 'bairro de localidade',
    ultimaColeta as 'ultima coleta de residuos',
    lotacao as 'lotacao'
    FROM rota;
    
SELECT CONCAT('a lixeira na rua ' , rua, 
' esta com lotacao ' , lotacao , ' no dia ' , ultimaColeta)
	as 'Atenção!'
		FROM rota;



-- login da empresa:  

CREATE TABLE loginAdmin ( 
idAdmin INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(50),
cargo VARCHAR(20),
senha VARCHAR(20) 
);

INSERT INTO loginAdmin (nome, cargo, senha) VALUES 
('pedro','gerente','Sampa2025'),
('ryan','supervisor','Erick2005'),
('thifany','po','ads1a'),
('emerson','supervisor','miautiana');


  
SELECT * FROM loginAdmin;
  
INSERT INTO loginAdmin (nome) VALUES 
('vivian');


ALTER TABLE loginAdmin ADD COLUMN email VARCHAR(40);


ALTER TABLE loginAdmin ADD CONSTRAINT chkCargo
CHECK (cargo IN ('gerente', 'supervisor', 'po', 'supervisor'));

UPDATE loginAdmin SET email = 'pedro.tamachiro@sptech.school'
	WHERE idAdmin= 1;
    
    UPDATE loginAdmin  SET email = 'ryan.ferreira@sptech.school'
	WHERE idAdmin= 2;
    
    UPDATE loginAdmin  SET email = 'thifany.calarara@sptech.school'
	WHERE idAdmin= 3;
    
    UPDATE loginAdmin  SET email = 'emerson.santana@sptech.school'
	WHERE idAdmin= 4;

SELECT * FROM loginAdmin;


--  TABELA ARDUINNO: 

CREATE TABLE arduino ( 
idArduino INT PRIMARY KEY AUTO_INCREMENT, 
lotacao FLOAT,
data1  DATETIME DEFAULT CURRENT_TIMESTAMP
);
 

INSERT INTO arduino VALUES 
(default, 50, default),
(default, 30, default),
(default, 90, default);

SELECT * FROM arduino ORDER BY idArduino DESC;
  

SELECT *,
CASE 
WHEN lotacao >= '40'then 'Enchendo'
ELSE 'vazio'
END AS 'Situação lixo'
FROM arduino;