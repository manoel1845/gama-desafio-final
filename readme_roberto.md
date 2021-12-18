<h1 align="center"> Grupo Pipe Five</h1> <br>
<p align="center">
  <a>
    <img alt="PipeFive" title="PipeFive" src="https://i5.walmartimages.com/asr/e80b097b-b093-4566-b32d-8da579efd798_1.ecba62a1475587b22f843785720ecd90.jpeg" width="450">
  </a>
</p>



# Objetivos
* Este projeto tem por objetivo exercitar os conhecimentos adquiridos no treinamento Gama DOTI 2.0.
* Live demo [_here_](https://www.example.com). <!-- If you have the project hosted somewhere, include the link here. -->

## Conteúdo
* [Escopo](#Escopo)
* [Tecnologias Utilizadas](#Tecnologias_Utilizadas)
* [Imagens](#Imagens)
* [Instalação](#Instalacao)
* [Status do Projeto](#Status_do_Projeto)
* [Espaço para melhorias](#Espaço_para_melhorias)
* [Agradecimentos](#Agradecimentos)
* [Contato](#Contato)
<!-- * [License](#license) -->


## Escopo
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
![Topologia do Projeto](/home/ubuntu/129115451287fYwK.jpg )
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