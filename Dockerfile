# 1. Utilizaremos una imagen de una distrubución pequeña (5~mb) de linux: alpine 

FROM alpine:3.14

# 2. Dentro del sistema (alpine) instalaremos python y pip. Alpine utiliza apk como admin de paquetes del sistema

RUN  apk add python3 && apk add --update py-pip && pip3 install --upgrade pip

# apk update &&
# --no-cache: para no utilizar la memoria cache en caso de que tenga algun paquete. metodo preventivo, no es obligatorio.
# python3-dev: instala tanto python3 como pip
# pip3 install --upgrade pip: desde pip3 instalamos la version actualizada de pip

# Para generar una imagen del Dockerfile en la terminal debemos utilizar:
# docker build -t api-finance .
# Donde api-finance es el nombre de la imagen, y . indica que queremos agregar todo el codigo del repositorio 
# en el que estamos parados (en este caso api-finance)

WORKDIR /app

COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

CMD ["python3", "src/app.py"]