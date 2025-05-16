# Usa imaggem leve do Python
FROM python:3.10-slim

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos
COPY . .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta usada pelo uvicorn
EXPOSE 8000

# Comando para rodar o FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]