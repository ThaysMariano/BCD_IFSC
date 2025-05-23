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

