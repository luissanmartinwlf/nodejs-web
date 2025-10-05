# Proyecto: Servidor Web con Node.js Containerizado con Docker

El objetivo es crear un servidor web simple con Node.js y el framework Express, y containerizarlo utilizando Docker.

---

## Tecnologías Utilizadas

* **Node.js v18**: Entorno de ejecución para JavaScript.
* **Express**: Framework para la creación de aplicaciones web y APIs.
* **Docker**: Plataforma para la containerización de la aplicación.

---

## Estructura del Proyecto

```
/
├── server.js        # Código fuente delservidor web
├── package.json     # Dependencias y metadatos del proyecto
├── Dockerfile       # Instrucciones para construir la imagen Docker
└── README.md        # Este archivo
```

---

## Cómo Ejecutar el Proyecto Localmente

Para ejecutar este proyecto, necesitas tener **Docker Desktop** instalado y en ejecución.

### 1. Clonar el Repositorio

```bash
git clone [https://github.com/luissanmartinwlf/nodejs-web.git](https://github.com/luissanmartinwlf/nodejs-web.git)
cd NOMBRE_DEL_REPO/nodejs-web
```

### 2. Construir la Imagen de Docker

Desde la carpeta del proyecto (`nodejs-web`), ejecuta el siguiente comando. Reemplaza `tu-usuario-dockerhub` por tu nombre de usuario.

```bash
docker build -t tu-usuario-dockerhub/nodejs-web:1.0 .
```

### 3. Ejecutar el Contenedor

Una vez construida la imagen, iníciala con el siguiente comando:

```bash
docker run --rm -p 3000:3000 tu-usuario-dockerhub/nodejs-web:1.0
```

### 4. Acceder al Servidor Web

Con el contenedor en ejecución, abre tu navegador web y visita la siguiente dirección:

`http://localhost:3000`

Deberías ver un encabezado con el mensaje: "¡Servidor Node.js con Express funcionando desde Docker!".

---

## Imagen en Docker Hub

Una imagen pre-construida de este proyecto está disponible públicamente en Docker Hub. Puedes ejecutarla directamente sin necesidad de construirla:

```bash
docker run --rm -p 3000:3000 lonewolff1/nodejs-web:1.0
```

---

## Explicación del `Dockerfile`

El `Dockerfile` está optimizado para la producción y la seguridad. A continuación se detallan los comandos más importantes:

| Comando | Descripción |
| :--- | :--- |
| `FROM node:18-alpine` | Utiliza una imagen base oficial de Node.js que es ligera (basada en Alpine Linux). |
| `LABEL maintainer="..."` | Añade metadatos a la imagen para su documentación y organización. |
| `ENV NODE_ENV=production` | Establece una variable de entorno clave que optimiza el rendimiento de Node.js y Express para producción. |
| `WORKDIR /usr/src/app` | Establece el directorio de trabajo principal dentro del contenedor. |
| `COPY package*.json ./` | Copia primero los archivos de dependencias para aprovechar la caché de capas de Docker. |
| `RUN npm install --omit=dev` | Instala únicamente las dependencias necesarias para producción, haciendo la imagen más pequeña y segura. |
| `USER node` | **(Seguridad)** Cambia al usuario `node` preexistente en la imagen, que no tiene privilegios de `root`. |
| `CMD ["node", "server.js"]` | Define el comando por defecto para iniciar la aplicación cuando se ejecute el contenedor. |