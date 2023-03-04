# Docker: ejercicio 2

## Lleva a cabo la práctica descrita en el primer artículo
https://docs.docker.com/get-started/
### 1. Ejecuta la imagen "hello-world":

```docker run hello-world```
Esto descargará la imagen "hello-world" desde Docker Hub y la ejecutará en un contenedor.

![image](https://user-images.githubusercontent.com/92718546/222927666-5752ef1c-7416-4620-b6c0-33e76dae59b1.png)

### 2. Muestra las imágenes Docker instaladas:
```docker images```

![image](https://user-images.githubusercontent.com/92718546/222927693-425acaf9-05ba-46a0-a6af-9c312bad2664.png)
Esto proporcionará una lista de todas las imágenes Docker que se encuentran en tu sistema, junto con su tamaño y su etiqueta.


### 3. Muestra los contenedores Docker:
```docker ps```

![image](https://user-images.githubusercontent.com/92718546/222927712-4b3c8dc2-5b64-477b-9f7e-7e1add370c2c.png)


## Lleva a cabo la práctica descrita en el segundo artículo
https://docs.docker.com/get-started/part2/

Clonamos para obtener la app:
```git clone https://github.com/docker/getting-started.git```


### 1. Edita el fichero Dockerfile
```
touch Dockerfile
sudo nano Dockerfile
```

Dentro escribimos:

```
# syntax=docker/dockerfile:1
   
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000

```
![image](https://user-images.githubusercontent.com/92718546/222930198-780eb282-12bb-4a8a-88af-1afcd5918def.png)

Este archivo especifica una imagen base de Node.js, establece un directorio de trabajo en "/app", copia todo el contenido del directorio actual al directorio "/app" dentro del contenedor, instala las dependencias necesarias y finalmente define un comando para ejecutar el archivo "index.js" dentro de la carpeta "src".

### 2. Construye el contenedor
```docker build -t getting-started .```

Esto construirá la imagen Docker con el nombre "getting-started" y la etiqueta "latest" en el sistema a partir del archivo Dockerfile en el directorio actual.
![image](https://user-images.githubusercontent.com/92718546/222930325-0a4ce038-74db-4221-bc04-577b764d3c5e.png)


### 3. Ejecútalo

```
docker run -p 3000:3000 getting-started
```

Esto ejecutará el contenedor "getting-started" en segundo plano y asignará el puerto 3000 de la máquina al puerto 3000 del contenedor. 
Podremos acceder en http://localhost:3000/

![image](https://user-images.githubusercontent.com/92718546/222930349-43903c69-b0c5-43df-8fde-88d4a3b5008c.png)


### 4. Create una cuenta en hub.docker.com
![image](https://user-images.githubusercontent.com/92718546/222927989-403d61de-6dfb-4c4b-ab91-79519391ecfa.png)

### 5. Publícalo
Tendremos que iniciar sesion con ```docker login``` e introducimos el nombre de usuario y contraseña:

![image](https://user-images.githubusercontent.com/92718546/222927937-b10682f9-45d6-4bca-bd8c-9fb47b1df2d9.png)

Hemos iniciado sesión con exito.

Etiquetamos la imagen a publicar con el nombre de usuario de Docker Hub y un nombre para la imagen:

```docker tag getting-started andrea25cb/getting-started```

Publicamos la imagen etiquetada en Docker Hub:

```docker push andrea25cb/getting-started:latest```

![image](https://user-images.githubusercontent.com/92718546/222930437-1a148f04-fecc-4c7a-bee0-d2be3a0437cd.png)

Una vez que se haya completado, la imagen estará disponible públicamente en Docker Hub:

![image](https://user-images.githubusercontent.com/92718546/222930454-63e7490e-25d7-410d-ac1a-a7d2a6639e9b.png)


