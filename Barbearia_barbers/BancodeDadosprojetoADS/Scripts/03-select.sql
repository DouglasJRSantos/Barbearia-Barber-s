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