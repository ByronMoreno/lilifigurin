FROM nginx:alpine

# Copiar el archivo HTML de la página web al directorio público de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exponer el puerto HTTP estándar
EXPOSE 80

# Iniciar servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
