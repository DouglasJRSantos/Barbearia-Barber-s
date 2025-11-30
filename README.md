# Barber’s — Projeto de Banco de Dados (SQLite)

Este repositório contém o desenvolvimento completo do banco de dados do minimundo **Barber’s**, incluindo modelagem, criação das tabelas, inserção de dados, consultas SQL e scripts de manutenção (UPDATE e DELETE).  
Todo o projeto foi otimizado para uso no **SQLiteStudio**.

---

## 📌 1. Descrição do Projeto

O sistema **Barber’s** controla informações sobre clientes, barbeiros, serviços e atendimentos.  
O banco de dados foi desenvolvido seguindo boas práticas de modelagem relacional, incluindo:

- Identificação das entidades principais  
- Definição clara das cardinalidades  
- Criação de chaves primárias e estrangeiras  
- Garantia de integridade referencial  
- Scripts de povoamento coerentes  
- Consultas SQL otimizadas

---

## 🧩 2. Modelo Lógico (DER)

Entidades principais:

- **Cliente**
- **Barbeiro**
- **Serviço**
- **Atendimento**

Relacionamentos:

- Um **cliente** pode realizar vários **atendimentos**
- Um **barbeiro** realiza vários **atendimentos**
- Um **serviço** pode estar associado a vários **atendimentos**

---

## 🗄️ 3. Estrutura do Banco de Dados

As tabelas foram estruturadas desta forma:

### **Cliente**
- id_cliente (PK)
- nome
- telefone

### **Barbeiro**
- id_barbeiro (PK)
- nome
- especialidade

### **Serviço**
- id_servico (PK)
- nome
- preco

### **Atendimento**
- id_atendimento (PK)
- id_cliente (FK)
- id_barbeiro (FK)
- id_servico (FK)
- data_atendimento

---

## 📥 4. Scripts Incluídos

Este repositório contém:

### ✔️ `create_tables.sql`
Criação das tabelas no SQLite.

### ✔️ `insert_data.sql`
Povoamento inicial do banco com registros reais.

### ✔️ `select_queries.sql`
2–5 consultas utilizando:
- WHERE  
- ORDER BY  
- LIMIT  
- JOIN  

### ✔️ `update_delete.sql`
- 3 comandos UPDATE  
- 3 comandos DELETE  

---

## ▶️ 5. Como Executar

1. Baixe e instale o **SQLiteStudio**  
2. Crie um banco novo (`barbers.db`)  
3. Importe e execute os arquivos `.sql` na seguinte ordem:
   1. `create_tables.sql`
   2. `insert_data.sql`
   3. `select_queries.sql` (opcional, para testes)
   4. `update_delete.sql` (opcional)

---

## 🛠️ 6. Tecnologias Utilizadas

- SQLite  
- SQLiteStudio  
- SQL (DDL e DML)  
- GitHub para versionamento

---

## 🧑‍💻 7. Autor

Desenvolvido por **Douglas**, estudante de Análise e Desenvolvimento de Sistemas.

---




  
