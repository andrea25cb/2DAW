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
```docker ps
```

![image](https://user-images.githubusercontent.com/92718546/222927712-4b3c8dc2-5b64-477b-9f7e-7e1add370c2c.png)


## Lleva a cabo la práctica descrita en el segundo artículo
https://docs.docker.com/get-started/part2/

### 1. Edita el fichero Dockerfile
Para editar el archivo Dockerfile, abre un editor de texto y crea un nuevo archivo llamado "Dockerfile" en un directorio de tu elección. Copia y pega el siguiente contenido en el archivo:

```FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```
Este archivo especifica una imagen base de Node.js, establece un directorio de trabajo en "/app", copia todo el contenido del directorio actual al directorio "/app" dentro del contenedor, instala las dependencias necesarias y finalmente define un comando para ejecutar el archivo "index.js" dentro de la carpeta "src".

### 2. Construye el contenedor
```docker build -t my-node-app .```

Esto construirá la imagen Docker con el nombre "my-node-app" y la etiqueta "latest" en tu sistema a partir del archivo Dockerfile en el directorio actual.

### 3. Ejecútalo

```
docker run -p 3000:3000 my-node-app
```
Esto ejecutará el contenedor "my-node-app" en segundo plano y asignará el puerto 3000 de la máquina al puerto 3000 del contenedor. 
Podremos acceder en http://localhost:3000/.


### 4. Create una cuenta en hub.docker.com

### 5. Publícalo


Nota: Para publicar una imagen debes conectar previamente con dockerhub, tal como se muestra en el siguiente artículo:
https://www.thegeekdiary.com/how-to-build-and-push-docker-image-to-the-docker-hub-repository/

