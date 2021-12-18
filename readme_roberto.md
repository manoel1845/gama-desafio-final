<h1 align="center"> Grupo Pipe Five</h2> <br>
<p align="center">
  <a>
    <img alt="PipeFive" title="PipeFive" src="https://i5.walmartimages.com/asr/e80b097b-b093-4566-b32d-8da579efd798_1.ecba62a1475587b22f843785720ecd90.jpeg" width="450">
  </a>
</p>


## Objetivos
* Este projeto tem por objetivo exercitar os conhecimentos adquiridos no treinamento Gama DOTI 2.0.
* Live demo [_here_](https://www.example.com). <!-- If you have the project hosted somewhere, include the link here. -->


## Conteúdo
* [Escopo](#Escopo)
* [Tecnologias_Utilizadas](#Tecnologias_Utilizadas)
* [Topologia](#Topologia)
* [Agradecimentos](#Agradecimentos)
* [Time](#Time)
<!-- * [License](#license) -->


## Escopo
- Criar uma rede isolada para esta aplicação
- Criar uma pipeline de infraestrutura para provisionar uma imagem que será utilizada em um cluster kubernetes(single master)
- Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que será utilizado nas aplicações que estarão no kubernetes. Esta base de dados, será provisionada em uma instância privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master
- Criar uma pipeline de desenvolvimento para deployar os ambientes de uma aplicação Java (dev, stage, prod) com ligação a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura
<!-- You don't have to answer all the questions - just the ones relevant to your project. -->


## Tecnologias_Utilizadas
- AWS
- Ubuntu
- MySql
- Terraform
- Ansible
- Jenkins
- Kubernets
- Docker


## Topologia
<p align="center">
  <a>
    <img alt="Topologia" title="Topologia" src="https://redes-informatica.webnode.pt/_files/200000018-cfe99d1de8/10(10).jpg" width="450">
  </a>
</p>

<!-- If you have screenshots you'd like to share, include them here. -->


## Agradecimentos
Agradecimentos ao Itaú por nos proporcionar este treinamento e ao time da Gama, especialmente ao professor Danilo por toda sua paciência e a Regina que nos suportou durante todo o período do curso.


## Time
Projeto desenvolvido pelo time Pipe Five:
- Michelle
- Manoel (Mineiro)
- Marcelo
- Roberto



<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

<!-- You don't have to include all sections - just the one's relevant to your project -->