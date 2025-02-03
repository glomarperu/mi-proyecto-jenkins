# Usa una imagen base de Nginx
FROM nginx:alpine

# Instala Node.js para htmlhint
RUN apk add --no-cache nodejs npm

# Instala htmlhint globalmente
RUN npm install -g htmlhint

# Copia los archivos de tu proyecto al contenedor
COPY . /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx cuando el contenedor arranca
CMD ["nginx", "-g", "daemon off;"]
