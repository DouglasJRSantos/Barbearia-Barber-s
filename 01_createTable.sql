--------Criação das Tabelas---------

PRAGMA foreign_keys = ON;

-------Tabela Cliente-----------
CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(50)
);
    
-------Tabela Serviço-----------
CREATE TABLE servico (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    duracao TIME,
    preco DECIMAL(10,2) NOT NULL
);

-------Tabela Barbeiro-----------
CREATE TABLE barbeiro (
    id_barbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone VARCHAR(15),
    especialidade TEXT(20)
);
-------Tabela Atendimento-----------
CREATE TABLE atendimento (
    id_atendimento INTEGER PRIMARY KEY AUTOINCREMENT,
    data_hora DATETIME NOT NULL,
    status TEXT(15),
    id_cliente INTEGER NOT NULL,
    id_barbeiro INTEGER NOT NULL,
    id_servico INTEGER NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_barbeiro) REFERENCES barbeiro(id_barbeiro),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);
-------Tabela Avaliação-----------

CREATE TABLE avaliacao (
    id_avaliacao INTEGER NOT NULL,
    nota INTEGER,
    comentario VARCHAR(200),
    data DATETIME,
    id_atendimento INTEGER NOT NULL,
    PRIMARY KEY (id_atendimento),
    FOREIGN KEY (id_atendimento) REFERENCES atendimento(id_atendimento)
);

-------------Insert--------------------

-------------- Cliente------------------

INSERT INTO cliente (nome, telefone, email) VALUES
('Lucas Moreira', '34999990000','lucas.moreira92@gmail.com'),
('Ana Silva', '34988887777','ana.silva.dev@outlook.com'),
('Pedro Santos', '34977776666','pedrosantos@outlook,com'),
('Ana Aparecida', '34977887777','ana.aparecida.dev@outlook.com'),
('Fernando Ramos', '35977887777','fernando.ramos77@yahoo.com'),
('Carla.Monteiro', '36977887777','carla.monteiro.tech@gmail.com');

--------------Serviço--------------------

INSERT INTO servico (nome, preco, duracao) VALUES
('Corte Masculino', 35.00, 40),
('Barba Completa', 25.00, 25),
('Sobrancelha', 10.00, 15),
('Progressiva', 80.00, 120);

-------------Barbeiro-------------------

INSERT INTO barbeiro (nome, telefone, especialidade) VALUES
('Rafael Dias', '34984587777', 'Cortes Fade'),
('Lucas Martins', '34989887777', 'Barbas e desenho'),
('Marcos Melo', '34986587777', 'Corte clássico'),
('Marcela Lima', '34243587777', 'Corte Rustico'),
('Eduardo Santana', '34985625777', 'Degradê');


----------------Atendimento---------------------

INSERT INTO atendimento (data_hora, status, id_cliente, id_barbeiro, id_servico) VALUES
('2025-01-13 09:00', 1, 1, 2, 1),
('2025-02-13 11:30', 1, 2, 1, 2),
('2025-04-14 14:15', 1, 3, 3, 1),
('2025-06-14 16:00', 1, 4, 2, 3),
('2025-08-15 10:45', 1, 3, 1, 1),
('2025-09-15 13:00', 1, 4, 3, 2);

------------Avaliação------------------------

INSERT INTO avaliacao (id_avaliacao, nota, comentario, data, id_atendimento) VALUES
(1, 10, 'Excelente', '2025-12-15', 1),
(2, 8, 'Muito Bom', '2025-10-10', 2),
(4, 3, 'Pessimo', '2025-09-28', 3),
(5, 5, 'Deu pro gasto', '2025-03-31', 4),
(6, 8, 'Muito Bom', '2025-12-14', 5),
(7, 1, 'Pessimo', '2025-02-11', 6);



---------------------------Consultas-----------------------

-----------1. Listar todos os clientes-------------------------------

SELECT * FROM cliente;

----------2. Serviços ordenados por preço (decrescente)--------------
SELECT nome, preco
FROM servico
ORDER BY preco DESC;

----------3. Atendimentos com nome do cliente e barbeiro (JOIN)------------

SELECT a.id_atendimento, c.nome AS cliente, b.nome AS barbeiro, a.data_hora
FROM atendimento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN barbeiro b ON a.id_barbeiro = b.id_barbeiro;

---------4. Ver os serviços realizados em cada atendimento----------------

SELECT 
    a.id_atendimento, 
    c.nome AS cliente, 
    s.nome AS servico
FROM atendimento ats
JOIN atendimento a ON ats.id_atendimento = a.id_atendimento
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN servico s ON ats.id_servico = s.id_servico
ORDER BY a.id_atendimento;


-------5. Buscar clientes por nome (WHERE + LIKE)

SELECT *
FROM cliente
WHERE nome LIKE '%a%';


-------------------UPDATE--------------------

----------- 1. Atualizar telefone de um cliente-----------------


UPDATE cliente
SET telefone = '34999995555'
WHERE id_cliente = 1;

------------2. Atualizar preço de um serviço--------------------

UPDATE servico
SET preco = 40.00
WHERE nome = 'Corte Masculino';

------------3. Trocar barbeiro de um atendimento----------------
UPDATE atendimento
SET id_barbeiro = 3
WHERE id_atendimento = 2;



----------------DELETE------------------------------

----------------1. Remover um serviço específico-------------

DELETE FROM servico
WHERE id_servico = 4;

SELECT * FROM atendimento

---------------2. Remover um atendimento------------------------

-- Remover um agendamento específico
DELETE FROM atendimento
WHERE id_atendimento = 1;



