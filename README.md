# Desafio final dos módulos de Dart

## Recursos utilizados:
* Banco de dados mysql community-8.0.23.0
* packages:
  *  mysql1: ^0.19.2
  *  dio: ^4.0.4

## Script para criação do banco de dados:

```
create database ibge;
use ibge;
CREATE TABLE estado (
  id int not null primary key auto_increment,
  uf varchar(2),
  nome varchar(255)
);


CREATE TABLE cidade (
  id int not null primary key auto_increment,
  id_uf int,
  nome varchar(255),
   FOREIGN KEY (id_uf)
      REFERENCES estado(id)
);​
 ```
 ### Foi recuperados os dados da api e salvo no banco de dados 



