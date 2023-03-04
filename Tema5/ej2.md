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

### 1. Edita el fichero Dockerfile
```sudo nano Dockerfile```

Dentro escribimos:

```
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN apk update && apk add --no-cache yarn
RUN rm /usr/local/bin/yarn
RUN npm install -g yarn
RUN yarn install --production
CMD ["node", "src/index.js"]

```

Este archivo especifica una imagen base de Node.js, establece un directorio de trabajo en "/app", copia todo el contenido del directorio actual al directorio "/app" dentro del contenedor, instala las dependencias necesarias y finalmente define un comando para ejecutar el archivo "index.js" dentro de la carpeta "src".

### 2. Construye el contenedor
```docker build -t my-node-app .```

Esto construirá la imagen Docker con el nombre "my-node-app" y la etiqueta "latest" en el sistema a partir del archivo Dockerfile en el directorio actual.

![image](https://user-images.githubusercontent.com/92718546/222929226-64642bf1-3e69-4d5f-9696-a14de5b60cd3.png)

### 3. Ejecútalo

```
docker run -p 3000:3000 my-node-app
```

Esto ejecutará el contenedor "my-node-app" en segundo plano y asignará el puerto 3000 de la máquina al puerto 3000 del contenedor. 
Podremos acceder en http://localhost:3000/.

### 4. Create una cuenta en hub.docker.com
![image](https://user-images.githubusercontent.com/92718546/222927989-403d61de-6dfb-4c4b-ab91-79519391ecfa.png)

### 5. Publícalo
Tendremos que iniciar sesion con ```docker login``` e introducimos el nombre de usuario y contraseña:

![image](https://user-images.githubusercontent.com/92718546/222927937-b10682f9-45d6-4bca-bd8c-9fb47b1df2d9.png)

Hemos iniciado sesión con exito.

Etiquetamos la imagen a publicar con el nombre de usuario de Docker Hub y un nombre para la imagen:

```docker tag my-node-app andrea25cb/my-node-app:latest```

Publicamos la imagen etiquetada en Docker Hub:
```docker push andrea25cb/my-node-app:latest```

Una vez que se haya completado, la imagen estará disponible públicamente en Docker Hub:


