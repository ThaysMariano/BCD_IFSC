# IFSC BCD

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


## Acessar o MySql

Dentro da Docker execute o comando abaixo para acessar como root:
```
mysql -u root -psenhaRoot
```

## Carregar Backup

### Copiar arquivo de backup para o docker

```
docker cp "<caminho do arquivo na sua máquina>" meumysql:/<nome do arquivo que deve ser criado no docker>
```

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