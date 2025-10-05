# 1. Usar una imagen oficial de Node.js (basada en Alpine)
FROM node:18-alpine

# 2. Añadir etiquetas de metadatos a la imagen
LABEL maintainer="luis.sanmartin.wlf@gmail.com" \
      version="1.0" \
      description="Servidor web simple con Node.js para la actividad de contenedores."

# 3. Establecer variables de entorno para Node.js
ENV NODE_ENV=production

# 4. Establecer el directorio de trabajo
WORKDIR /usr/src/app

# 5. Copiar package.json y package-lock.json para aprovechar el cache de Docker
COPY package*.json ./

# 6. Instalar las dependencias de producción
RUN npm install --omit=dev

# 7. Copiar el resto del código de la aplicación
COPY . .

# 8. La imagen de Node.js ya crea un usuario no-root llamado 'node'. Lo usaremos por seguridad.
USER node

# 9. Exponer el puerto 3000 en el que corre la aplicación
EXPOSE 3000

# 10. Comando para iniciar la aplicación
CMD [ "node", "server.js" ]