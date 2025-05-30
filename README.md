# IFSC BCD

Dê git clone nesse repositótio

## Executar a docker

### Subir o ambiente com Docker Compose

Abra o terminal na pasta do arquivo Docker e execute:
```
docker compose up -d
```

### Acessar o container do MySQL

```
docker exec -it meumysql bash
```
> [!NOTE]
> Caso esteja no Windows, será preciso executar a docker no Docker Desktop antes de executar o comando acima.

### Copiar arquivo de backup para o docker

```
docker cp "/home/aluno/BCD_IFSC/<nome .sql salvo>" meumysql:/<nome do arquivo que deve ser criado no docker>
```

## Acessar o MySql

Dentro da Docker execute o comando abaixo para acessar como root:
```
mysql -u root -psenhaRoot
```

### Criar arquivo de registro

Dentro do terminal do SQL execute:

```
tee registro.txt
```

Faça suas operações e após terminar execute o comando abaixo para parar de registrar e salvar o arquivo.

```
notee
```

## Carregar Backup


### Copiar arquivo de backup para o docker

```
docker cp "~caminho do arquivo na sua máquina~" meumysql:/backup.sql
```

### Carregar DataBase para o MySql

Acesse o MySql e então crie a base de dados caso não exista:

```SQL
CREATE DATABASE IF NOT EXISTS banco
```

E então carregue o arquivo de backup pelo bash da Docker:

```
mysql banco < backup.sql -u root -psenhaRoot
```

Agora o ambiente MySql está pronto para ser usado.

## Salvar Backup

### Salvar Arquivo SQL

Fora da docker execute o comando:

```
docker exec meumysql mysqldump -u root -psenhaRoot Banco > BackupsSQL/backup.sql
```

### Salvar Arquivo de Registro

Fora da docker execute o comando:
```
docker cp meumysql:/registro.txt "~caminho na máquina~"
```

## Passo a passo RASC


1. Dê git clone nesse repositótio
1. Entre na pasta do repositório
1. Abra o terminal na pasta do arquivo Docker e execute:
```
docker compose up -d
```
4. Acesse o container MySQL
```
docker exec -it meumysql bash
```
5. Dentro da Docker execute o comando abaixo para acessar como root:
```
mysql -u root -psenhaRoot
```

## Enviar arquivos para o Docker

1. Abra outro terminal
1. Copie arquivo de backup para o docker
```
docker cp "/home/aluno/BCD_IFSC/<nome .sql salvo>" meumysql:/<nome do arquivo que deve ser criado no docker.sql>
```


## Pegar os arquivos de Backup no Mysql
1. Insira no mysql
```SQL
CREATE DATABASE IF NOT EXISTS <nome do banco de dados>
```
2. dar exit
3. inserir no bash
```SQL
mysql <nome banco> < <nome backup> -u root -psenhaRoot
```
4. entrar nvamente no mysql com
```
mysql -u root -psenhaRoot
```
5. inserir 
```SQL
USE <nome banco>
```


