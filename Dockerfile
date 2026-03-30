FROM python:3.10

# Evita perguntas interativas
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Define diretório de trabalho
WORKDIR /app

# Copia dependências
COPY requirements.txt .

# Instala libs Python
RUN pip install --no-cache-dir -r requirements.txt

# Expõe porta do Jupyter
EXPOSE 8888

# Comando padrão
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]