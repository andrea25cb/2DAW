# DOCKER
## Objetivos:
* Conceptos básicos sobre Docker
* Imagenes Docker y contenedores
* Volúmenes de almacenamiento

## Ejercicios:

# 1:
### First Alpine Linux Containers:
Primero deberemos instalar docker con ```apt install docker.io```

Instalamos alpine con:
```docker image pull alpine```
![image](https://user-images.githubusercontent.com/92718546/222923653-228e0bf5-0416-41a2-a273-90570fd8a88f.png)

El comando pull obtiene la imagen alpina del registro de Docker y la guarda en nuestro sistema. En este caso el registro es Docker Hub.

Para ver las imagenes que tenemos haremos:

```docker image ls```
![image](https://user-images.githubusercontent.com/92718546/222923728-3a5cf4cf-725f-4aaa-bddd-853d6a7f4c9c.png)

Crearemos un contenedor docker basandonos en esa imagen:

```docker container run alpine ls -l```

![image](https://user-images.githubusercontent.com/92718546/222923785-e71c486f-ae65-4f61-8b4e-cd35a5296cb2.png)

Cuando hacemos 'run', el cliente de Docker encuentra la imagen (alpine), crea el contenedor y luego ejecuta un comando en ese contenedor.

Para entrar al contenedor y ejecutar el shell de Linux haremos:

```docker container run -it alpine /bin/sh```
Podemos salir con ```exit```

Para ver si los contenedores que hemos ejecutado:
```docker container ls -a```
![image](https://user-images.githubusercontent.com/92718546/222924195-346b0e48-19e9-4a9e-966c-f2dc24a2fa35.png)

Cada ejecucion es un contenedor aislado. Cada contenedor tiene un sistema de archivos independiente y se ejecuta en un espacio de nombres diferente; por defecto, un contenedor no tiene forma de interactuar con otros contenedores, incluso con los de la misma imagen.

Entramos otra vez en el shell y escribiremos:
```
 echo "hello world" > hello.txt

 ls
```
![image](https://user-images.githubusercontent.com/92718546/222924339-2ae9df3f-b65f-432b-9927-7041e71e1205.png)

Como vemos en la imagen, se ha creado un nuevo archivo "hello.txt" con las palabras "hello world" dentro.

Salimos con exit.

Para ejecutar un contenedor necesitamos su ID, que podemos ver con ```docker container ls -a``` en la primera columna.

Para ver qué contenedores se están ejecutando haremos ```docler container ls```:
![image](https://user-images.githubusercontent.com/92718546/222924664-f815e15d-4a67-4933-8910-9db24d068628.png)

 Como vemos, se está ejecutando un contenedor.
 
Ahora hemos usado el shel de ash, así que en lugar de simplemente salir como lo hizo /bin/sh antes, ash espera un comando. Podemos enviar un comando al contenedor para que se ejecute usando el comando exec, de la siguiente manera:
![image](https://user-images.githubusercontent.com/92718546/222924892-054b8dd2-ce33-458a-949f-6be5fe8214b2.png)

# 2:
### Creación de imágenes a partir de un contenedor
Empecemos ejecutando un shell interactivo en un contenedor de ubuntu: 
```docker container run -ti ubuntu bash```

Para personalizar un poco las cosas, instalaremos un paquete llamado 'figlet' en este contenedor:
```
apt-get update
apt-get install -y figlet
```

comprobamos que funciona:
```figlet "hello docker```
![image](https://user-images.githubusercontent.com/92718546/222925110-cc6cd965-c42f-49b5-bc6f-5e515a0a1657.png)

Para crear una imagen tenemos que hacer "commit" en el contenedor:
``` docker container commit CONTAINER_ID ```
Vemos las imagenes con ```docker image ls```:
![image](https://user-images.githubusercontent.com/92718546/222925264-6bfd881a-37ff-4fc7-8482-290ea03d4c7b.png)
Cambiaremos el nombre de la etiqueta, por ejemplo le pondré 'andrea':
```
docker image tag <IMAGE_ID> andrea
docker image ls
```
![image](https://user-images.githubusercontent.com/92718546/222925359-d317d15c-eeb7-444e-a9e3-8cff49bb1bc3.png)

Ahora ejecutaremos un contenedor basado en la imagen andrea recién creada:

````docker container run andrea figlet hello````

Nos devuelve:
![image](https://user-images.githubusercontent.com/92718546/222925451-fde1f571-ada6-486a-bc7e-48b5493dfaf3.png)

### Creación de imágenes usando un Dockerfile

Escribimos ```vi index.js``` y dentro los siguientes comandos:
```
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);
```

El archivo que acabamos de crear es el código javascript para nuestro servidor, que imprimirá un mensaje "hello".

https://training.play-with-docker.com/ops-s1-hello/

# 3:

https://training.play-with-docker.com/ops-s1-images/
