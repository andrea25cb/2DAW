# Docker: ejercicio 5

Lee la documentación del módulo cuatro “Docker-compose” del curso:
https://github.com/josedom24/curso_docker_ies

Lleva a cabo al menos tres de los ejemplos mostrados en el módulo y documentalo en tu repositorio incluyendo capturas de pantalla.

Instalamos docker-compose: 

```apt install docker-compose```

![image](https://user-images.githubusercontent.com/92718546/222932965-a98ee72d-8dee-4a1c-b8ef-47cd9f30d33f.png)

## Ejemplo 1: Despliegue de la aplicación guestbook

En este ejemplo vamos a desplegar con docker-compose la aplicación *guestbook*, que estudiamos en el módulo de redes: [Ejemplo 1: Despliegue de la aplicación Guestbook](../modulo3/guestbook.md).

```cd /examples/guestbook```

Necesitamos crear un archivo llamado docker-compose.yml con la siguiente configuración:

```sudo nano docker-compose.yml ```

```yaml
version: '3.1'
services:
  app:
    container_name: guestbook
    image: iesgn/guestbook
    restart: always
    ports:
      - 80:5000
  db:
    container_name: redis
    image: redis
    restart: always
```

Para crear el escenario:

```
docker-compose up -d
```

![image](https://user-images.githubusercontent.com/92718546/222933186-b439e0b6-083d-4377-8171-f067420d60d8.png)


Para listar los contenedores:

```
docker-compose ps     
```

![image](https://user-images.githubusercontent.com/92718546/222933197-8fda57b4-c4fc-4111-b113-435202d59e72.png)


Para parar los contenedores:

```
docker-compose stop 
```

![image](https://user-images.githubusercontent.com/92718546/222933220-a9fd114f-db02-4527-8635-dc22fb743d3a.png)


Para eliminar el escenario:

```
docker-compose down
```

![image](https://user-images.githubusercontent.com/92718546/222933258-8e166971-4bad-4b3b-8321-a7c57958751d.png)

---

## Ejemplo 2: Despliegue de la aplicación Temperaturas

En este ejemplo vamos a desplegar con docker-compose la aplicación *Temperaturas*, que estudiamos en el módulo de redes: [Ejemplo 2: Despliegue de la aplicación Temperaturas](../modulo3/temperaturas.md).

En este caso el fichero `docker-compose.yml` puede tener esta forma:

```yaml
version: '3.1'
services:
  frontend:
    container_name: temperaturas-frontend
    image: iesgn/temperaturas_frontend
    restart: always
    ports:
      - 80:3000
    depends_on:
      - backend
  backend:
    container_name: temperaturas-backend
    image: iesgn/temperaturas_backend
    restart: always
```


Para crear el escenario:

```
docker-compose up -d

```

![image](https://user-images.githubusercontent.com/92718546/222933654-1e6d0ec0-35e2-4521-bda8-48925f591512.png)


Para listar los contenedores:

```
docker-compose ps
```

![image](https://user-images.githubusercontent.com/92718546/222933646-7de79a8f-aeb1-4af1-8e4e-c375908cfd21.png)


---

## Ejemplo 3: Despliegue de WordPress + Mariadb

En este ejemplo vamos a desplegar con docker-compose la aplicación WordPress + MariaDB, que estudiamos en el módulo de redes: [Ejemplo 3: Despliegue de Wordpress + mariadb ](../modulo3/wordpress.md).


### Utilizando volúmenes docker

Por ejemplo para la ejecución de wordpress persistente con volúmenes docker podríamos tener un fichero `docker-compose.yml` con el siguiente contenido:

```yaml
version: '3.1'
services:
  wordpress:
    container_name: servidor_wp
    image: wordpress
    restart: always
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: user_wp
      WORDPRESS_DB_PASSWORD: asdasd
      WORDPRESS_DB_NAME: bd_wp
    ports:
      - 80:80
    volumes:
      - wordpress_data:/var/www/html/wp-content
  db:
    container_name: servidor_mysql
    image: mariadb
    restart: always
    environment:
      MYSQL_DATABASE: bd_wp
      MYSQL_USER: user_wp
      MYSQL_PASSWORD: asdasd
      MYSQL_ROOT_PASSWORD: asdasd
    volumes:
      - mariadb_data:/var/lib/mysql
volumes:
    wordpress_data:
    mariadb_data:
```

Para crear el escenario:

```
docker-compose up -d
```

![image](https://user-images.githubusercontent.com/92718546/222934208-8f8bde0d-9c6a-4905-9f01-cdbc8d414af0.png)


Para listar los contenedores:

```
docker-compose ps
```

![image](https://user-images.githubusercontent.com/92718546/222934219-b4bfa299-bf85-4112-97ab-d0c1a69379eb.png)


Para parar los contenedores:

```
docker-compose stop 

```

![image](https://user-images.githubusercontent.com/92718546/222934226-6489c1b3-935e-4207-80a7-1845146a77b9.png)


Para borrar los contenedores:

```
docker-compose rm
```

![image](https://user-images.githubusercontent.com/92718546/222934230-207b42e6-8bb6-40ac-a325-58f60411bc1a.png)


Para eliminar el escenario (contenedores, red y volúmenes):

```
docker-compose down -v
```

![image](https://user-images.githubusercontent.com/92718546/222934241-398cb154-8398-4e88-a8c1-b4d398e066f1.png)

