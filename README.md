# Relatório de Transformação de Dados

Durante o processo de transformação de dados, foram realizadas diversas etapas desde a criação das tabelas até a limpeza e preparação dos dados para análise. Abaixo está um resumo de todas as operações realizadas:

## 1. Criação das Tabelas e Inserção de Dados:

- Foram criadas as seguintes tabelas:
  - Tabela `employee`: armazena informações sobre os funcionários da empresa.
  - Tabela `dependent`: armazena informações sobre os dependentes dos funcionários.
  - Tabela `department`: armazena informações sobre os departamentos da empresa.
  - Tabela `dept_locations`: armazena informações sobre a localização dos departamentos.
  - Tabela `project`: armazena informações sobre os projetos da empresa.
- Os dados foram inseridos nas tabelas conforme fornecido.

## 2. Verificação dos Cabeçalhos e Tipos de Dados:

- Utilizamos a instrução `PRAGMA table_info(table_name);` para verificar os cabeçalhos e tipos de dados de todas as tabelas do banco de dados. Isso nos permitiu ter uma visão geral da estrutura das tabelas e dos tipos de dados utilizados.

## 3. Modificação dos Valores Monetários para o Tipo Double Preciso:

- Identificamos que os valores monetários estavam armazenados como inteiros e decidimos modificá-los para o tipo de dados `REAL` para garantir uma maior precisão. Devido às limitações do SQLite, criamos uma nova tabela com a estrutura desejada, copiamos os dados da tabela original e ajustamos o tipo de dados da coluna `salary`.

## 4. Verificação e Tratamento de Valores Nulos:

- Identificamos registros com valores nulos na coluna `superssn` da tabela `employee`. Optamos por preenchê-los com um valor padrão de `0` para garantir a consistência dos dados.

## 5. Identificação e Tratamento de Funcionários e Departamentos sem Gerentes:

- Identificamos funcionários e departamentos sem gerentes verificando registros com valores nulos nas colunas `superssn` da tabela `employee` e `mgrssn` da tabela `department`, respectivamente. Para resolver essa questão, atribuímos os próprios números de seguridade social (`ssn`) como gerentes para os funcionários e um valor padrão para os departamentos.

Este relatório resume todas as etapas realizadas durante o processo de transformação de dados, desde a criação das tabelas e inserção de dados até a limpeza e preparação dos dados para análise. Se precisar de mais informações ou detalhes adicionais, não hesite em entrar em contato.
