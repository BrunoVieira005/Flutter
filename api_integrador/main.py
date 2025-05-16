# Importa as bibliotecas
from fastapi import FastAPI, Request
from pydantic import BaseModel
import random

app = FastAPI() 

bomba_estado = 0 # 0 desligada e 1 ligada
temp_increment =2
umid_increment =5
solo_increment = 10
ph_increment =1

class BombaCommand(BaseModel):
    estado: int # 0 ou 1

@app.post("/bomba")
def controlar_bomba(cmd: BombaCommand):
    global bomba_estado
    if cmd.estado in [0,1]:
        bomba_estado = cmd.estado
        return {"mensagem": f"Bomba {"ligada" if bomba_estado else "desligada"}"}
    return {"erro": "Estado inválido. Utilize 0 ou 1."}

@app.get("/dados")
def obter_dados():
    # Gera valores com incrementos específicos
    temperatura = random.randrange(20, 35 + temp_increment, temp_increment)
    umidade = random.randrange(40, 80 + umid_increment, umid_increment)
    sensor_umidsolo = random.randrange(0, 100 + solo_increment, solo_increment)
    pH = random.randrange(0, 14 + ph_increment, ph_increment)
    return {
        "temperatura": temperatura,
        "umidade": umidade,
        "bomba": bomba_estado,
        "sensor_umidsolo": sensor_umidsolo,
        "pH": pH
    }