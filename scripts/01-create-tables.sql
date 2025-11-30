PRAGMA foreign_keys = ON;
CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(50)
);
    
CREATE TABLE servico (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    duracao TIME,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE barbeiro (
    id_barbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone VARCHAR(15),
    especialidade TEXT(20)
);

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

CREATE TABLE avaliacao (
    id_avaliacao INTEGER NOT NULL,
    nota INTEGER,
    comentario VARCHAR(200),
    data DATETIME,
    id_atendimento INTEGER NOT NULL,
    PRIMARY KEY (id_atendimento),
    FOREIGN KEY (id_atendimento) REFERENCES atendimento(id_atendimento)
);
