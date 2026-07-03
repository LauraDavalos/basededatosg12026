# Contenedores de sistemas gestores de Base de Datos
![ImagenDocker](../img/Docker.png)
## Imagenes

>Comandos para cada imagen

- Comando para descargar imagen de postgres

```
docker pull postgres:14.22-trixie
```

- Descargar imagen tutorial de Docker
```
docker pull docker/getting-started
```
# Creacion de contenedores
```docker
docker run -e -p 80:80 
```docker
Donde:
-d detach (backround)
-p puerto (el primer numero de puerto no se cambia, el segundo di podemos cambiarlo)

## Contenedor de Tutorial de Docker
docker run -d -p 80:80 (link)
 docker run -d -p 80:80 (ID de la imagen primeros 5 digitos)
```
 ### Contenedor MariaDB sin volumen
 docker run -d --name Server-MariadbG1 -p 3343:3306 -e  MARIADB_ROOT_PASSWORD=123456 b1c7b
 ```
 ```
 ## Contenedor de Mariadb con volumen

``` docker
docker volume create v-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e  MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:var/lib/mysql e0236
```

 ## Contenedor de postgres con volumen

``` docker
docker volume create v-postgresg1

docker run -d --name Server-PostgresG1 -p 5455:5432 -e  POSTGRES_PASSWORD=123456 -v v-postgresg1:/var/lib/postgresql/data eba8d

```

 ## Contenedor SQLSERVER con volumen

``` docker
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
-u 0 \
-p 1450:1433 \
--name SQLServerG1 \
-d \
-v v-sqlserverg1:/var/opt/mssql/data \
d38c2a
```
### Comandos de Docker
| Comando | Descripción |
| :--- | :--- |
| **docker --version**| _Muestra la version del Docker_|
| **docker pull nombre_imagen**| _Desacarga una imagen de Docker hub_|[Docker Hub](https://hub.docker.com/r/docker/getting-started)
| **docker image**| _Mustra todas la imagenes_|
| **docker run**| _Permite crear un contenedor_|
| **docker ps -a**| _Visualiza los contenedores que estan en ejecución_|
| **docker ps -a**| _Visualiza los contenedores que estan en ejecución_|
| **docker container ls -a**| _Visualiza todos los contenedores_|
| **docker stop nombre o id**| _Detiene el contenedor_|
| **docker start nombre o id**| _inicia un contenedor_|
| **docker rm nombre o id**|_Borra imagen_|
| **docker rm -f nombre o id**| _Elimina un contenedor que esta en ejecución_|
| **docker volumer ls**| _Muestra los volumenes que existen en docker_|
| **docker volume create v-(nombralo)**| _Crea un volumen_|







