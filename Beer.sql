-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE ToughBeer;

USE ToughBeer;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50) unique,
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table tanque (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
    dataCadastro datetime,
    tempoMaturacao varchar(15),
    constraint chkTempoMaturacao
    check (tempoMaturacao in ('rápido', 'médio', 'longo')),
	setor varchar(50),
    fk_usuario int,
    foreign key (fk_usuario) references usuario(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	volume DECIMAL,
	dataMedida DATETIME,
    situacao varchar(100),
	fk_tanque INT,
	FOREIGN KEY (fk_tanque) REFERENCES tanque(id)
);

INSERT INTO usuario (nome, email, senha) VALUES
('Carlota Lota', 'carlota@toughbeer.com', 'Carlota123!'),
('Mariana Lopes', 'mariana@toughbeer.com', 'Mariana123!'),
('João Henrique', 'joao@toughbeer.com', 'Joao123!'),
('Paula Silva', 'paula@toughbeer.com', 'Paula123!');

INSERT INTO aviso (titulo, descricao, fk_usuario) VALUES
('Manutenção Programada', 'Haverá uma manutenção no setor 3 amanhã.', 1),
('Atualização do Sistema', 'Nova versão da plataforma disponível.', 2),
('Alerta de Segurança', 'Tentativa de acesso suspeito detectada.', 1),
('Treinamento Interno', 'Sessão de atualização das normas de segurança.', 4);

INSERT INTO tanque (descricao, dataCadastro, tempoMaturacao, setor, fk_usuario) VALUES
('Tanque de maturação Ales', '2025-01-10 08:00:00','rápido', 'Setor A', 1),      -- rapido 1-4 semanas maturacao
('Tanque de maturação Lagers', '2025-01-10 08:00:00','médio', 'Setor A', 1),    -- medio 30-40 dias maturacao
('Tanque de maturação Lambics', '2025-01-10 08:00:00','longo', 'Setor A', 1),   -- longo 1-3 ano maturacao
('Tanque de fermentação Ales', '2025-01-20 14:00:00','rápido', 'Setor B', 2),
('Tanque de fermentação Lagers', '2025-01-20 14:00:00','médio', 'Setor B', 2),
('Tanque de fermentação Lambics', '2025-01-20 14:00:00','longo', 'Setor B', 2),
('Tanque especial Tough', '2025-01-25 09:15:00','longo', 'Setor C', 3),
('Tanque especial Duff', '2025-01-25 09:15:00','longo', 'Setor C', 4);

INSERT INTO medida (volume, dataMedida, situacao, fk_tanque) VALUES
(14400, '2025-02-01 10:00:00', 'Normal', 1),
(14300, '2025-02-05 08:00:00', 'Normal', 1),
(14250, '2025-02-06 08:00:00', 'Normal', 1),
(14320, '2025-02-07 08:00:00', 'Normal', 1),
(14200, '2025-02-08 08:00:00', 'Normal', 1),
(13900, '2025-02-09 08:00:00', 'Normal', 1),
(13300, '2025-02-01 12:00:00', 'Normal', 2),
(13200, '2025-02-05 09:00:00', 'Normal', 2),
(12900, '2025-02-06 09:00:00', 'Normal', 2),
(12500, '2025-02-07 09:00:00', 'Normal', 2),
(11100, '2025-02-08 09:00:00', 'Alerta', 2),
(11010, '2025-02-09 09:00:00', 'Alerta', 2),
(7200, '2025-02-02 09:30:00', 'Alerta', 3),
(6900, '2025-02-05 10:00:00', 'Alerta', 3),
(6500, '2025-02-06 10:00:00', 'Alerta', 3),
(6100, '2025-02-07 10:00:00', 'Alerta', 3),
(5300, '2025-02-08 10:00:00', 'Alerta', 3),
(4800, '2025-02-09 10:00:00', 'Crítico', 3),
(12800, '2025-02-02 11:00:00', 'Normal', 4),
(12600, '2025-02-05 14:00:00', 'Normal', 4),
(12450, '2025-02-06 14:00:00', 'Normal', 4),
(12300, '2025-02-07 14:00:00', 'Normal', 4),
(12100, '2025-02-08 14:00:00', 'Normal', 4),
(11900, '2025-02-09 14:00:00', 'Alerta', 4),
(2000, '2025-02-03 08:00:00', 'Crítico', 5),
(1900, '2025-02-05 16:30:00', 'Crítico', 5),
(1800, '2025-02-06 16:30:00', 'Crítico', 5),
(1600, '2025-02-07 16:30:00', 'Crítico', 5),
(1500, '2025-02-08 16:30:00', 'Crítico', 5),
(1300, '2025-02-09 16:30:00', 'Crítico', 5),
(10600, '2025-02-03 10:00:00', 'Alerta', 6),
(10200, '2025-02-05 18:00:00', 'Alerta', 6),
(9800,  '2025-02-06 18:00:00', 'Alerta', 6),
(9100,  '2025-02-07 18:00:00', 'Alerta', 6),
(7500,  '2025-02-08 18:00:00', 'Alerta', 6),
(6200,  '2025-02-09 18:00:00', 'Alerta', 6),
(14000, '2025-02-04 07:45:00', 'Normal', 7),
(13950, '2025-02-05 07:30:00', 'Normal', 7),
(13800, '2025-02-06 07:30:00', 'Normal', 7),
(13650, '2025-02-07 07:30:00', 'Normal', 7),
(13500, '2025-02-08 07:30:00', 'Normal', 7),
(13300, '2025-02-09 07:30:00', 'Normal', 7),
(13600, '2025-02-04 09:00:00', 'Normal', 8),
(13400, '2025-02-05 13:00:00', 'Normal', 8),
(13100, '2025-02-06 13:00:00', 'Normal', 8),
(12750, '2025-02-07 13:00:00', 'Normal', 8),
(12300, '2025-02-08 13:00:00', 'Normal', 8),
(11850, '2025-02-09 13:00:00', 'Alerta', 8);

 select count(setor) as 'nº de tanques em maturação'
   from tanque where setor = 'Setor A';
   
SELECT 
    descricao,
    dataCadastro,
    TIMESTAMPDIFF(DAY, dataCadastro, NOW()) AS 'Dias de maturação'
FROM tanque;