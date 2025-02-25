# Teste Técnico Mobile BeTalent 

Este repositório contém a minha solução para o Teste Técnico Mobile da BeTalent. O desafio consistiu em construir uma aplicação mobile que exibe uma tabela de funcionários, com funcionalidades de pesquisa e formatação de dados. Utilizei **Flutter** para desenvolver a aplicação, seguindo as diretrizes e requisitos propostos.

---

## 📱 Sobre o Projeto

O objetivo do projeto foi criar uma interface que exibe uma lista de funcionários, com as seguintes informações:

- **Imagem** (thumbnail do usuário);
- **Nome**;
- **Cargo**;
- **Data de admissão**;
- **Telefone**.

Além disso, a aplicação permite filtrar os funcionários por **nome**, **cargo** ou **telefone** por meio de um campo de pesquisa. As datas e telefones são formatados diretamente no front-end.

---

## 🎨 Mockup

O design da aplicação foi baseado no [projeto no Figma](https://www.figma.com/design/Lpdera6rS8SztMUAwzkpN0/Teste-T%C3%A9cnico-Mobile-BeTalent?node-id=1-4&node-type=canvas&t=NI5lQZvrO1hsQCqz-0), que forneceu o guia de estilos e a estrutura da tela.

---

## ✅ Requisitos Cumpridos

- **Tecnologia**: Utilizei **Flutter** para o desenvolvimento.
- **Funcionalidades**:
  - Exibição de uma lista de funcionários com imagem, nome, cargo, data de admissão e telefone.
  - Campo de pesquisa que filtra os funcionários por **nome**, **cargo** ou **telefone**.
  - Formatação de datas e telefones no front-end.
- **Organização**: O código foi estruturado de forma modular, seguindo boas práticas de desenvolvimento.

---

## 🛠️ Pré-requisitos

Para rodar o projeto, você precisará das seguintes ferramentas instaladas em sua máquina:

- [Git](https://git-scm.com/)
- [Flutter](https://flutter.dev/) (com Dart incluso)

---

## ‼️Acesso aos dados da API simulada

Para ter acesso aos dados que alimentarão o projeto, faça o seguinte:

1. caso você não tenha, instale o pacote [json-server](https://github.com/typicode/json-server);
2. clone este repositório do GitHub em sua máquina: [https://github.com/BeMobile/desafio-mobile](https://github.com/BeMobile/desafio-mobile);
3. entre na pasta do projeto, em sua máquina, e, por meio da linha de comando, execute o comando `json-server --watch db.json`, para consumir a API simulada;
4. inicie a estrutura e o desenvolvimento do projeto.

É necessário deixar o json-server rodando no terminal para que os dados sejam visualizados no projeto.

Caso você tenha problemas com o json-server, tente rodá-lo com `npx json-server db.json` ou 
com `yarn json-server <path>/db.json`, em que `<path>` é o caminho completo até o diretório em que o arquivo db.json está localizado. Se mesmo assim não funcionar, busque ajuda na web.

obs: utilizei `npx json-server db.json`
## 📂 Estrutura do Projeto

O projeto foi organizado da seguinte forma:
```
lib/
├── main.dart                # Ponto de entrada da aplicação
├── models/                  # Modelos de dados 
├── providers/               # Providers para gerenciamento de estado 
├── services/                # Serviços para consumo da API 
├── utils/                   # Utilitários
├── widgets/                 # Widgets
└── view/                    # Tela da aplicação
|
└── test/  
```

---

##  Critérios de Avaliação

 1. Lógica de Programação

 2. Organização

 3. Proficiência em Flutter

 4. README

---

## 📤 Envio da Solução

O projeto foi hospedado no meu repositório do GitHub. O link para o repositório foi enviado por meio do formulário de Teste Técnico.
