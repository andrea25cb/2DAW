# Docker: ejercicio 3


### 1. Descarga la imagen de ubuntu
```
docker pull ubuntu
```

![image](https://user-images.githubusercontent.com/92718546/222930492-dae1e25d-9a02-4ad0-b3ff-70d70349f8c4.png)


### 2. Descarga la imagen de hello-world
```
docker pull hello-world
```

![image](https://user-images.githubusercontent.com/92718546/222930502-f7c7a16d-8661-4de6-af89-f80137976457.png)


### 3. Descarga la imagen nginx
```
docker pull nginx
```

![image](https://user-images.githubusercontent.com/92718546/222930521-d09aadd1-3f6f-467a-b4c3-a4a2ecbd9c0f.png)


### 4. Muestra un listado de todas la imágenes
```
docker images
```

![image](https://user-images.githubusercontent.com/92718546/222930539-798a8679-bf8e-416e-8927-0b35bb568ca7.png)


### 5. Ejecuta un contenedor hello-world y dale nombre “myhello1”
```
docker run --name myhello1 hello-world
```

![image](https://user-images.githubusercontent.com/92718546/222930556-df1209c6-c5aa-42bf-9764-a09d4d5239b0.png)


### 6. Ejecuta un contenedor hello-world y dale nombre “myhello2”
```
docker run --name myhello2 hello-world
```

### 7. Ejecuta un contenedor hello-world y dale nombre “myhello3”
```
docker run --name myhello3 hello-world
```

### 8. Muestra los contenedores que se están ejecutando
```
docker ps
```

![image](https://user-images.githubusercontent.com/92718546/222930634-b26879aa-b5d0-4758-bd6f-f435e6aa2261.png)


### 9. Para el contenedor "myhello1”
```
docker stop myhello1
```

### 10. Para el contenedor "myhello2”
```
docker stop myhello2
```

### 11. Borra el contenedor “myhello1”
```
docker rm myhello1
```

![image](https://user-images.githubusercontent.com/92718546/222930692-1ae5f7a2-c3b1-4f53-ba51-fe712ffa7a24.png)


### 12. Muestra los contenedores que se están ejecutando.
```
docker container ls
```
![image](https://user-images.githubusercontent.com/92718546/222930745-9e3c9fd9-b009-456e-8b7d-a8b0e271f2a0.png)


### 13. Borra todos los contenedores
Primero debemos parar todos los contenedores
```
docker stop $(docker ps -aq)
```

Luego podremos borrarlos:
```
docker rm $(docker ps -aq)
```
![image](https://user-images.githubusercontent.com/92718546/222931062-d38116d0-8198-4113-b9a1-7e0481003025.png)

