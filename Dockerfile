# Usa una imagen base de Node.js (asegurando que se pueda instalar htmlhint)
FROM node:16-alpine

# Instala htmlhint globalmente
RUN npm install -g htmlhint

# Copia los archivos de tu proyecto al contenedor
COPY . /usr/share/nginx/html

# Expose el puerto 80
EXPOSE 80
