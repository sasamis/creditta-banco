# Imagem base com Flutter pré-instalado
FROM cirrusci/flutter:latest

# Instala dependências adicionais
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    git \
    xz-utils \
    zip \
    libglu1-mesa \
    && apt-get clean

# Diretório de trabalho
WORKDIR /workspace

# Atualiza Flutter e habilita Flutter Web
RUN flutter channel stable && flutter upgrade && flutter config --enable-web

# Checa o ambiente
RUN flutter doctor
