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