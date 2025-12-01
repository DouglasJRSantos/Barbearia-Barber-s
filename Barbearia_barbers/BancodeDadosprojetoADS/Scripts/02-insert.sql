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