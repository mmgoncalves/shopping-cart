# Projeto Mobile Sistem de Notificações

## Tech stack
- Linguagem: Swift 5.7
- IDE: Xcode 14.0.1

<br>

## Pré-requisitos: 
- Utilizar qualquer computador rodando um macOS; 
- Xcode na versão 14.0.1 ou superior; 
- Conexão com a internet habilitada;

<br>

## Executando o projeto
- Faça o download ou um clone do projeto;
- Faça a descompactação do arquivo **.zip**;
- Acesse a pasta e execute o arquivo com a extensão **.xcodeproj**;
- Após o Xcode ser aberto, espere até que todos as dependências sejam baixadas;
  
  ![alt text](Sources/dependencias.png "Dependencias")
- Execute o build do Xcode e espere até o simulador abrir;
- Pronto, utilize e navegue pelo aplicativo normalmente;

<br><br>

## Ambiente de testes
````
Utilizei o serviço de Mock API da plataforma “Beeceptor”, onde é possível criar diversos endpoints e com diferentes retornos. 
O Todos os cenários mapeados para o MVP do projeto podem ser acessados através deste endereço: 
https://beeceptor.com/console/vibbra, sendo possível habilitar ou desabilitar alguns endpoints 
e forçar o erro para um determinado cenário.
````
<img src="Sources/beeceptor.png" alt="" width="800"/>

<br><br>

## Arquitetura MVVM
  ![alt text](Sources/MVVMPattern.png)
  
  ````
  O principal motivo de escolher a arquitetura MVVM é abstrair as Views para 
  que o código por trás da lógica de negócios poss ser reduzido a uma extensão.
  Além disso, outros benefícios do MVVM são: Camada lógica e de apresentação são fracamente acopladas; 
  Sem qualquer tipo de automação e interação da interface do usuário, é possível testá-lo; 
  O código se torna extremamente fácil de ser testado.
  ````
<br><br>

  ## Outros detalhes do projeto
  - Frameworks via SPM: Alamofire, keychain-Swift, Quick e Nimble para testes
  - Alguns design patterns utilizados: Dependency Injection, Coordinator Pattern, Delegate Pattern, Adapter, Protocol delegation Pattern.

<br><br>

## Funcionalidades

### Tela de login
<img src="Sources/login.png" alt="" height="300"/>


### Cadastro de usuáro  
<img src="Sources/cadastro.png" alt="" height="300"/>

### Lista de todos os aplicativos cadastrados
<img src="Sources/lista-apps.png" alt="" height="300"/>


### Modal para criar um novo aplicativo
<img src="Sources/novo-app.png" alt="" height="300"/>

### Tela de configuração de SMS
<img src="Sources/sms-config.png" alt="" height="300"/>
