# Usa una imagen base ligera de Alpine Linux
FROM alpine:latest

# Etiqueta del creador (opcional)
LABEL maintainer="Tu Nombre <luhpelayo@gmail.com>"

# Instala el servidor web Nginx y otras dependencias (como curl para descargar contenido)
RUN apk --no-cache add nginx curl

# Copia tus archivos HTML, CSS e imágenes al contenedor
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY img/ /usr/share/nginx/html/img/

# Copia la configuración personalizada de Nginx (opcional)
COPY nginx.conf /etc/nginx/nginx.conf

# Puerto en el que Nginx escuchará (puerto predeterminado)
EXPOSE 80

# Comando a ejecutar cuando se inicie el contenedor
CMD ["nginx", "-g", "daemon off;"]
