import os
from dotenv import load_dotenv

# Carica le variabili d'ambiente dal file .env
load_dotenv()

# Elenco delle variabili d'ambiente richieste
required_vars = ['JWT_SECRET', 'NEO4J_URI', 'NEO4J_USERNAME', 'NEO4J_PASSWORD']

# Verifica se le variabili d'ambiente richieste sono presenti
for var in required_vars:
    if var not in os.environ:
        print(f"Errore: la variabile d'ambiente {var} non è dichiarata.")
        exit(1)

print("Tutte le variabili d'ambiente richieste sono dichiarate.")
