create database Retech;
use Retech;

create table empresa (
idCodigo int primary key auto_increment,
NomeEmpresa varchar (30),
CNPJ char(14),
Dono varchar (40),
Senha char (8),
telefone char(11)
);
insert into empresa (NomeEmpresa,CNPJ,Responsavel,senha) values 
('Coleta Verde', '91143214000172', 'Pedro Cardoso', '10102006');


insert into empresa (NomeEmpresa, CNPJ, Responsavel, senha) values
('EcoTech', '12345678000195', 'Ana Silva', '28922000'),
('AgroMais', '98765432000160', 'Carlos Pereira', '03091996'),
('InovaLog', '45678912000134', 'Fernanda Costa', '02071897'),
('MediLife', '32165498000122', 'João Mendes', '30082007'),
('Construmax', '74125896000109', 'Mariana Rocha', '10802025');

select * from empresa;

drop table empresa;

create table arduino (
idlixeira int primary key auto_increment,
profundidade int,
localizacao varchar(100),
nivel_bateria int,
tipo_residuo varchar(20));

insert into arduino (profundidade, localizacao, nivel_bateria, tipo_residuo) values
(35, 'Av. Paulista, 1000 - São Paulo/SP', 85, 'orgânico'),
(120, 'Rua Vergueiro, 500 - São Paulo/SP', 60, 'reciclável'),
(80, 'Praça da Sé, Centro - São Paulo/SP', 40, 'papel'),
(50, 'Av. Faria Lima, 200 - São Paulo/SP', 95, 'vidro'),
(150, 'Av. Sapopemba, 3000 - São Paulo/SP', 70, 'plástico'),
(20, 'Rua Augusta, 1500 - São Paulo/SP', 30, 'orgânico'),
(90, 'Av. Tiradentes, 400 - São Paulo/SP', 55, 'metal');

select * from arduino;


drop table arduino;

create table localizacao (
    idlocal int primary key auto_increment,
    endereco varchar(150),
    bairro varchar(50),
    cidade varchar(50),
    estado varchar(2)
);

insert into localizacao (endereco, bairro, cidade, estado) values
('Av. Paulista, 1000', 'Bela Vista', 'São Paulo', 'SP'),
('Rua Vergueiro, 500', 'Paraíso', 'São Paulo', 'SP'),
('Praça da Sé, 1', 'Sé', 'São Paulo', 'SP'),
('Av. Faria Lima, 200', 'Pinheiros', 'São Paulo', 'SP'),
('Av. Sapopemba, 3000', 'Sapopemba', 'São Paulo', 'SP'),
('Rua Augusta, 1500', 'Consolação', 'São Paulo', 'SP'),
('Av. Tiradentes, 400', 'Santana', 'São Paulo', 'SP'),
('Av. Brigadeiro Faria Lima, 1200', 'Itaim Bibi', 'São Paulo', 'SP'),
('Rua dos Timbiras, 450', 'Centro', 'São Paulo', 'SP'),
('Av. Ipiranga, 600', 'República', 'São Paulo', 'SP');








