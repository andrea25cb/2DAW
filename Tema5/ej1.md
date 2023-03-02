# DOCKER: ejercicio 1
## Instala Docker en Ubuntu

### 1. Actualizar los paquetes del sistema
```
sudo apt-get update
```

### 2. Instalar herramientas necesarias para permitir que el sistema operativo use repositorios HTTPS:
```
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

```

### 3. Agregar la clave GPG oficial de Docker:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

```

### 4. Agregar el repositorio de Docker a la lista de fuentes de APT:
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

```

### 5. Actualizamos la base de datos de paquetes de APT con:
```
sudo apt-get update

```

### 6. Finalmente, instalamos Docker Engine:
```
sudo apt-get install docker-ce docker-ce-cli containerd.io

```

## Una vez hecho todo esto, Docker estará instalado. Podemos comprobarlo con:
```
sudo systemctl status docker
```
