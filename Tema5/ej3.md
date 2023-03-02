# Docker: ejercicio 3


### 1. Descarga la imagen de ubuntu
```
docker pull ubuntu
```

### 2. Descarga la imagen de hello-world
```
docker pull hello-world
```

### 3. Descarga la imagen nginx
```
docker pull nginx
```

### 4. Muestra un listado de todas la imágenes
```
docker images
```

### 5. Ejecuta un contenedor hello-world y dale nombre “myhello1”
```
docker run --name myhello1 hello-world
```

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

### 12. Muestra los contenedores que se están ejecutando.
```
docker ps
```

### 13. Borra todos los contenedores
```
docker rm $(docker ps -aq)
```

