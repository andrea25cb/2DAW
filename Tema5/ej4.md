# Docker: ejercicio 4: Almacenamiento y redes Docker

Lee la documentación del módulo tres “Almacenamiento y redes Docker” del curso:
https://github.com/josedom24/curso_docker_ies


Lleva a cabo al menos tres de los ejemplos mostrados en el módulo y documentalo en tu repositorio incluyendo capturas de pantalla.

## Ejemplo 1: Despliegue de la aplicación Guestbook

En este ejemplo vamos a desplegar una aplicación web que requiere de dos servicios (servicio web y servicio de base de datos) para su ejecución. La aplicación se llama GuestBook y necesita los dos siguientes servicios:

* La aplicación guestbook es una aplicación web desarrollada en python que es servida por el puerto 5000/tcp. Utilizaremos la imagen `iesgn/guestbook`.
* Esta aplicación guarda la información en una base de datos no relacional redis, que utiliza el puerto 6379/tcp para conectarnos. Usaremos la imagen `redis`.

Descargo la imagen iesgn/guestbook y redis desde Docker Hub utilizando los siguientes comandos:

```
docker pull iesgn/guestbook
docker pull redis
```

![image](https://user-images.githubusercontent.com/92718546/222931704-4a3eac30-6c96-43b0-9d3f-28b6fae965f2.png)


Accedo al directorio de la aplicación Guestbook:
```
cd examples/guestbook/
```
Creo un contenedor Docker para la imagen redis utilizando el siguiente comando:

```
docker run -d --name redis-container --network guestbook-network -p 6379:6379 --network-alias redis redis

```

![image](https://user-images.githubusercontent.com/92718546/222931797-ddf713e9-c55f-4c99-95cf-e3ea0afbc2e0.png)


Este comando ejecuta un contenedor Docker en segundo plano (-d) utilizando la imagen redis. El contenedor se expone en el puerto 6379 del host (-p 6379:6379), lo que significa que la base de datos no relacional Redis estará disponible en localhost:6379.


Creo un contenedor Docker para la imagen iesgn/guestbook utilizando el siguiente comando:
```docker run -d --name guestbook-container --network guestbook-network -p 5000:5000 iesgn/guestbook```

Vamos a crear los contenedores en la misma red:

```
docker network create red_guestbook
```

Para ejecutar los contenedores:

```
docker run -d --name redis --network red_guestbook -v /opt/redis:/data redis redis-server --appendonly yes


docker run -d -p 80:5000 --name guestbook --network red_guestbook iesgn/guestbook
```



## Ejemplo 2: Despliegue de la aplicación Temperaturas

Vamos a hacer un despliegue completo de una aplicación llamada Temperaturas. Esta aplicación nos permite consultar la temperatura mínima y máxima de todos los municipios de España. Esta aplicación está formada por dos microservicios:

* `frontend`: Es una aplicación escrita en Python que nos ofrece una página web para hacer las búsquedas y visualizar los resultados. Este microservicio hará peticiones HTTP al segundo microservicio para obtener la información. Este microservicio ofrece el servicio en el puerto 3000/tcp. Usaremos la imagen `iesgn/temperaturas_frontend`.
* `backend`: Es el segundo microservicio que nos ofrece un servicio web de tipo API Restful. A esta API Web podemos hacerles consultas sobre los municipios y sobre las temperaturas. En este caso, se utiliza el puerto 5000/tcp para ofrecer el servicio. Usaremos la imagen `iesgn/temperaturas_backend`.

El microservicio `frontend` se conecta a `backend` usando el nombre `temperaturas-backend`. Por lo tanto el contenedor con el micorservicio `backend` tendrá ese nombre para disponer de una resolución de nombres adecuada en el dns.

Vamos a crear una red para conectar los dos contenedores:

```bash
$ docker network create red_temperaturas
```

Para ejecutar los contenedores:

```bash
$ docker run -d --name temperaturas-backend --network red_temperaturas iesgn/temperaturas_backend

$ docker run -d -p 80:3000 --name temperaturas-frontend --network red_temperaturas iesgn/temperaturas_frontend
```



## Ejemplo 3: Despliegue de Wordpress + mariadb

Para la instalación de WordPress necesitamos dos contenedores: la base de datos (imagen `mariadb`) y el servidor web con la aplicación (imagen `wordpress`). Los dos contenedores tienen que estar en la misma red y deben tener acceso por nombres (resolución DNS) ya que de principio no sabemos que ip va a coger cada contenedor. Por lo tanto vamos a crear los contenedores en la misma red:

```bash
$ docker network create red_wp
```

Siguiendo la documentación de la imagen [mariadb](https://hub.docker.com/_/mariadb) y la imagen [wordpress](https://hub.docker.com/_/wordpress) podemos ejecutar los siguientes comandos para crear los dos contenedores:

```bash
$ docker run -d --name servidor_mysql \
                --network red_wp \
                -v /opt/mysql_wp:/var/lib/mysql \
                -e MYSQL_DATABASE=bd_wp \
                -e MYSQL_USER=user_wp \
                -e MYSQL_PASSWORD=asdasd \
                -e MYSQL_ROOT_PASSWORD=asdasd \
                mariadb
                
$ docker run -d --name servidor_wp \
                --network red_wp \
                -v /opt/wordpress:/var/www/html/wp-content \
                -e WORDPRESS_DB_HOST=servidor_mysql \
                -e WORDPRESS_DB_USER=user_wp \
                -e WORDPRESS_DB_PASSWORD=asdasd \
                -e WORDPRESS_DB_NAME=bd_wp \
                -p 80:80 \
                wordpress

$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
5b2c5a82a524        wordpress           "docker-entrypoint.s…"   9 minutes ago       Up 9 minutes        0.0.0.0:80->80/tcp   servidor_wp
f70f22aed3d1        mariadb             "docker-entrypoint.s…"   9 minutes ago       Up 9 minutes        3306/tcp             servidor_mysql
```



