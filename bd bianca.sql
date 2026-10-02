CREATE DATABASE kart_gt_bd;
USE kart_gt_bd;

CREATE TABLE baterias(
id_bateria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) not null,
valor decimal (8,2) not null,
duracao_minutos int not null
);

create table pilotos(
id_piloto int auto_increment primary key,
nome varchar (100) not null,
cpf varchar (14) unique not null,
telefone varchar (20),
data_nascimento date not null
);

create table karts(
id_kart int auto_increment primary key,
numero int not null unique,
categoria varchar(50) not null,
potencia_hp varchar (20)
);

create table reservas(
id_reserva int auto_increment primary key,
id_piloto int not null,
id_bateria int not null,
id_kart int,
data_corrida date default (current_date),
status varchar(20) default 'confirmada',
foreign key (id_piloto) references pilotos(id_piloto),
foreign key (id_bateria) references baterias(id_bateria),
foreign key (id_kart) references karts(id_kart)
);

INSERT INTO baterias (nome, valor, duracao_minutos) VALUES
('treino livre',99.90,15),
('sprint race',149.90,25),
('grand prix gp',199.90,40);

INSERT INTO karts (numero, categoria, potencia_hp) VALUES
(12, 'rental padrao','6.5 HP'),
(27, 'rental padrao','6.5 HP'),
(44, 'rental padrao','13 HP');

INSERT INTO pilotos (nome, cpf, telefone, data_nascimento) values
('Lucas Mendes', '111.222.333.44', '41 99999-9999', '1998.05.14'),
('Amanda de Castro', '555.666.777.88', '41 99999-4444', '2001.11.120'),
('Raissa Nogueira', '999.888.777.55', '41 98765-4321', '1995.08.22');

INSERT INTO reservas (id_piloto, id_bateria, id_kart) VALUES
(1,2,1);