# Usa una imagen base que contenga Node.js
FROM node:16-alpine

# Configura el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json (si los tienes) para instalar dependencias
COPY package*.json ./

# Instala las dependencias de npm
RUN npm install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto si necesitas servir una aplicación web
EXPOSE 80

# Ejecuta un comando para iniciar tu aplicación si es necesario, o simplemente mantén el contenedor activo
CMD ["npm", "start"]
