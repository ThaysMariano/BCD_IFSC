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

## Carregar Backup

### Carregar DataBase para o MySql

Acesse o MySql e então crie a base de dados caso não exista:

```SQL
CREATE DATABASE IF NOT EXISTS <nome do banco de dados>
```

E então carregue o arquivo de backup pelo bash da Docker:

```
mysql <nome do banco de dados> < <nome do arquivo de backup> -u root -psenhaRoot
```

Agora o ambiente MySql está pronto para ser usado.

## Salvar Backup

### Salvar Arquivo SQL

```
docker exec meumysql mysqldump -u root -psenhaRoot <nome do banco> > <caminho para salvar o .sql>
```

### Salvar Arquivo de Registro

```
docker cp meumysql:/<nome do arquivo.txt> "<caminho na máquina>"
```

