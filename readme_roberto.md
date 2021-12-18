# Nome do Projeto
> Este projeto tem por objetivo exercitar os conhecimentos adquiridos no treinamento Gama DOTI 2.0.
> Live demo [_here_](https://www.example.com). <!-- If you have the project hosted somewhere, include the link here. -->

## Conteúdo
* [Meta](#general-information)
* [Tecnologias Utilizadas](#technologies-used)
* [Imagens](#screenshots)
* [Instalação](#setup)
* [Status do Projeto](#project-status)
* [Espaço para melhorias](#room-for-improvement)
* [Agradecimentos](#acknowledgements)
* [Contato](#contact)
<!-- * [License](#license) -->


## Meta
- Criar uma rede isolada para esta aplicação
- Criar uma pipeline de infraestrutura para provisionar uma imagem que será utilizada em um cluster kubernetes(single master)
- Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que será utilizado nas aplicações que estarão no kubernetes. Esta base de dados, será provisionada em uma instância privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master
- Criar uma pipeline de desenvolvimento para deployar os ambientes de uma aplicação Java (dev, stage, prod) com ligação a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura
<!-- You don't have to answer all the questions - just the ones relevant to your project. -->


## Tecnologias Utilizadas
- AWS
- Ubuntu
- MySql
- Terraform
- Ansible
- Jenkins
- Kubernets
- Docker


## Imagens
![Example screenshot](./img/screenshot.png)
<!-- If you have screenshots you'd like to share, include them here. -->


## Instalação
What are the project requirements/dependencies? Where are they listed? A requirements.txt or a Pipfile.lock file perhaps? Where is it located?

Proceed to describe how to install / setup one's local environment / get started with the project.


## Status do Projeto
Project is: _in progress_ / _complete_ / _no longer being worked on_. If you are no longer working on it, provide reasons why.


## Espaço para melhorias
Include areas you believe need improvement / could be improved. Also add TODOs for future development.

Room for improvement:
- Improvement to be done 1
- Improvement to be done 2

To do:
- Feature to be added 1
- Feature to be added 2


## Agradecimentos
Give credit here.
- This project was inspired by...
- This project was based on [this tutorial](https://www.example.com).
- Many thanks to...


## Contato
Criado by [@flynerdpl](https://www.flynerd.pl/) - feel free to contact me!


<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

<!-- You don't have to include all sections - just the one's relevant to your project -->