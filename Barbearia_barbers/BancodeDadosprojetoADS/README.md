# 💇‍♂️ Barbearia Barber's - Sistema de Banco de Dados

## 📋 Descrição

Este projeto implementa um **Sistema de Gerenciamento de Banco de Dados para uma Barbearia**, desenvolvido como atividade avaliativa em um curso de ADS (Análise e Desenvolvimento de Sistemas). O sistema gerencia clientes, barbeiros, serviços, atendimentos e avaliações através de um banco de dados relacional em **SQLite3**.

### Objetivo
Demonstrar proficiência em:
- Criação de estruturas de banco de dados (DDL)
- Manipulação de dados (DML) com INSERT, UPDATE e DELETE
- Consultas avançadas (DQL) com JOINs, WHERE, ORDER BY e LIMIT
- Relacionamentos entre tabelas com chaves estrangeiras

---

## 🏗️ Estrutura do Banco de Dados

O banco de dados é composto por **5 tabelas principais** com os seguintes relacionamentos:

### 📌 Tabelas

#### **1. Cliente**
Armazena informações dos clientes da barbearia.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_cliente` | INTEGER (PK) | Identificador único do cliente |
| `nome` | TEXT | Nome completo do cliente |
| `telefone` | TEXT | Telefone para contato |
| `email` | TEXT | Email do cliente |

**Relacionamentos:**
- Um cliente pode ter múltiplos atendimentos (1:N com `atendimento`)

---

#### **2. Serviço**
Define os serviços oferecidos pela barbearia com preços e durações.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_servico` | INTEGER (PK) | Identificador único do serviço |
| `nome` | TEXT | Nome do serviço (ex: Corte Masculino) |
| `duracao` | INTEGER | Duração em minutos |
| `preco` | DECIMAL | Preço do serviço em reais |

**Relacionamentos:**
- Um serviço pode ser utilizado em múltiplos atendimentos (1:N com `atendimento`)

---

#### **3. Barbeiro**
Informações dos profissionais que executam os serviços.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_barbeiro` | INTEGER (PK) | Identificador único do barbeiro |
| `nome` | TEXT | Nome completo do barbeiro |
| `telefone` | TEXT | Telefone para contato |
| `especialidade` | TEXT | Especialidade/técnica (ex: Fade, Barba) |

**Relacionamentos:**
- Um barbeiro pode realizar múltiplos atendimentos (1:N com `atendimento`)

---

#### **4. Atendimento**
Registra os agendamentos e execução de serviços.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_atendimento` | INTEGER (PK) | Identificador único do atendimento |
| `data_hora` | DATETIME | Data e hora do atendimento |
| `status` | TEXT | Status (ex: Confirmado, Cancelado) |
| `id_cliente` | INTEGER (FK) | Referência ao cliente |
| `id_barbeiro` | INTEGER (FK) | Referência ao barbeiro |
| `id_servico` | INTEGER (FK) | Referência ao serviço |

**Relacionamentos:**
- Chave estrangeira para `cliente` (N:1)
- Chave estrangeira para `barbeiro` (N:1)
- Chave estrangeira para `servico` (N:1)
- Um atendimento pode ter uma avaliação (1:1 com `avaliacao`)

---

#### **5. Avaliação**
Armazena as avaliações dos clientes sobre os atendimentos recebidos.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_avaliacao` | INTEGER (PK) | Identificador único da avaliação |
| `nota` | INTEGER | Nota de 1 a 10 |
| `comentario` | TEXT | Comentário do cliente |
| `data` | DATETIME | Data da avaliação |
| `id_atendimento` | INTEGER (FK) | Referência ao atendimento (UNIQUE) |

**Relacionamentos:**
- Chave estrangeira para `atendimento` (1:1)
- Uma avaliação por atendimento (constraint UNIQUE)

---

## 📁 Estrutura do Repositório

```
Barbearia-Barber-s/
├── Barbearia_barbers/
│   └── BancodeDadosprojetoADS/
│       ├── README.md                    # Este arquivo
│       ├── Scripts/
│       │   ├── 01-createtable.sql       # DDL - Criação das tabelas
│       │   ├── 02-insert.sql            # DML - Inserção de dados
│       │   ├── 03-select.sql            # DQL - Consultas e JOINs
│       │   ├── 04-updates.sql           # DML - Atualizações de dados
│       │   └── 05-deletes.sql           # DML - Deleções de dados
│       └── Extra/                       # Arquivos adicionais
```

---

## 🚀 Como Usar

### ✅ Requisitos

- **SQLite3** (versão 3.0 ou superior)
- **Git** (para clonar o repositório)
- **Windows, Linux ou macOS**

#### Instalação do SQLite3

**Windows:**
```powershell
# Usando Chocolatey
choco install sqlite

# Ou fazer download de https://www.sqlite.org/download.html
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install sqlite3
```

**macOS:**
```bash
brew install sqlite3
```

### 📥 Clonando o Repositório

```powershell
# Abrir PowerShell e clonar o repositório
git clone https://github.com/DouglasJRSantos/Barbearia-Barber-s.git
cd "Barbearia-Barber-s/Barbearia_barbers/BancodeDadosprojetoADS"
```

### ⚙️ Executando os Scripts

Os scripts devem ser executados **na ordem correta** para garantir a integridade referencial:

#### **Passo 1: Criar as Tabelas**
```powershell
sqlite3 barbearia.db < Scripts/01-createtable.sql
```

#### **Passo 2: Inserir Dados**
```powershell
sqlite3 barbearia.db < Scripts/02-insert.sql
```

#### **Passo 3: Executar Consultas**
```powershell
sqlite3 barbearia.db < Scripts/03-select.sql
```

#### **Passo 4: Atualizar Dados**
```powershell
sqlite3 barbearia.db < Scripts/04-updates.sql
```

#### **Passo 5: Deletar Dados**
```powershell
sqlite3 barbearia.db < Scripts/05-deletes.sql
```

### 💻 Abrindo o Banco Interativamente

Para explorar o banco de dados manualmente:

```powershell
sqlite3 barbearia.db
```

Dentro do terminal SQLite, execute comandos como:

```sql
-- Ver todas as tabelas
.tables

-- Ver estrutura de uma tabela
.schema cliente

-- Executar uma consulta
SELECT * FROM cliente;

-- Sair
.exit
```

---

## 📊 Scripts SQL - Detalhamento

### **01-createtable.sql** - DDL (Data Definition Language)
**Propósito:** Criar a estrutura do banco de dados.

✨ **Características:**
- Define 5 tabelas relacionadas
- Ativa foreign keys (`PRAGMA foreign_keys = ON`)
- Usa chaves primárias (PRIMARY KEY)
- Implementa relacionamentos com chaves estrangeiras (FOREIGN KEY)
- Tipos de dados apropriados (TEXT, INTEGER, DATETIME, DECIMAL)

---

### **02-insert.sql** - DML (Data Manipulation Language)
**Propósito:** Popular o banco com dados iniciais para testes.

📊 **Dados inseridos:**
- **6 Clientes:** Lucas Moreira, Ana Silva, Pedro Santos, Ana Aparecida, Fernando Ramos, Carla Monteiro
- **4 Serviços:** Corte Masculino (R$ 35), Barba Completa (R$ 25), Sobrancelha (R$ 10), Progressiva (R$ 80)
- **5 Barbeiros:** Rafael Dias, Lucas Martins, Marcos Melo, Marcela Lima, Eduardo Santana
- **6 Atendimentos:** Registros de agendamentos com datas, clientes, barbeiros e serviços
- **6 Avaliações:** Notas e comentários dos clientes

---

### **03-select.sql** - DQL (Data Query Language)
**Propósito:** Demonstrar consultas avançadas com diferentes técnicas.

🔍 **Consultas incluídas:**

1. **Listar todos os clientes**
   ```sql
   SELECT * FROM cliente;
   ```

2. **Serviços ordenados por preço (decrescente)**
   ```sql
   SELECT nome, preco
   FROM servico
   ORDER BY preco DESC;
   ```

3. **Atendimentos com nome do cliente e barbeiro (JOIN)**
   ```sql
   SELECT a.id_atendimento, c.nome AS cliente, b.nome AS barbeiro, a.data_hora
   FROM atendimento a
   JOIN cliente c ON a.id_cliente = c.id_cliente
   JOIN barbeiro b ON a.id_barbeiro = b.id_barbeiro;
   ```

4. **Serviços realizados em cada atendimento**
   - Demonstra múltiplos JOINs e relações complexas

5. **Buscar clientes por nome (WHERE + LIKE)**
   ```sql
   SELECT *
   FROM cliente
   WHERE nome LIKE '%a%';
   ```

---

### **04-updates.sql** - DML (Atualizações)
**Propósito:** Demonstrar modificação de dados existentes com condições.

✏️ **Atualizações incluídas:**

1. **Atualizar telefone de um cliente**
   ```sql
   UPDATE cliente
   SET telefone = '34999995555'
   WHERE id_cliente = 1;
   ```

2. **Atualizar preço de um serviço**
   ```sql
   UPDATE servico
   SET preco = 40.00
   WHERE nome = 'Corte Masculino';
   ```

3. **Trocar barbeiro de um atendimento**
   ```sql
   UPDATE atendimento
   SET id_barbeiro = 3
   WHERE id_atendimento = 2;
   ```

---

### **05-deletes.sql** - DML (Deleções)
**Propósito:** Demonstrar remoção de dados com condições específicas.

🗑️ **Deleções incluídas:**

1. **Remover um serviço específico**
   ```sql
   DELETE FROM servico
   WHERE id_servico = 4;
   ```

2. **Remover um atendimento**
   ```sql
   DELETE FROM atendimento
   WHERE id_atendimento = 8;
   ```

3. **Excluir um cliente**
   ```sql
   DELETE FROM cliente
   WHERE id_cliente = 10;
   ```

---

## 💡 Exemplos de Execução

### Exemplo 1: Executar todos os scripts em sequência
```powershell
# Windows PowerShell
$scripts = @("01-createtable.sql", "02-insert.sql", "03-select.sql", "04-updates.sql", "05-deletes.sql")
foreach ($script in $scripts) {
    sqlite3 barbearia.db < "Scripts/$script"
}
```

### Exemplo 2: Listar atendimentos com detalhes completos
```sql
SELECT 
    a.id_atendimento,
    c.nome AS cliente,
    b.nome AS barbeiro,
    s.nome AS servico,
    s.preco AS valor,
    a.data_hora AS agendamento,
    a.status
FROM atendimento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN barbeiro b ON a.id_barbeiro = b.id_barbeiro
JOIN servico s ON a.id_servico = s.id_servico
ORDER BY a.data_hora DESC;
```

### Exemplo 3: Listar avaliações com feedback
```sql
SELECT 
    av.id_avaliacao,
    c.nome AS cliente,
    av.nota,
    av.comentario,
    av.data
FROM avaliacao av
JOIN atendimento a ON av.id_atendimento = a.id_atendimento
JOIN cliente c ON a.id_cliente = c.id_cliente
ORDER BY av.nota DESC;
```

---

## ❓ Troubleshooting

### Problema: "sqlite3: command not found"
**Solução:** SQLite3 não está instalado. Siga as instruções de instalação acima.

### Problema: "File is not a database"
**Solução:** O arquivo `barbearia.db` foi corrompido. Delete-o e execute novamente o script 01-createtable.sql.

### Problema: "FOREIGN KEY constraint failed"
**Solução:** Verifique se está inserindo IDs que não existem nas tabelas relacionadas. Execute os scripts na ordem correta.

### Problema: "no such table"
**Solução:** Certifique-se de executar o script 01-createtable.sql antes dos outros.

---

## 📞 Link do Repositório GitHub

🔗 **Repositório Público:**
```
https://github.com/DouglasJRSantos/Barbearia-Barber-s
```

**Clone com:**
```bash
git clone https://github.com/DouglasJRSantos/Barbearia-Barber-s.git
```

---

## 📝 Autor

- **Douglas Júnior Rodrigues dos Santos**
- Curso: Análise e Desenvolvimento de Sistemas (ADS)
- Data: Novembro de 2025

---

## 📄 Licença

Este projeto é fornecido como material educacional. Sinta-se livre para usar, modificar e distribuir para fins acadêmicos.

---

**Última atualização:** 30 de Novembro de 2025

