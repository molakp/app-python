#!/bin/bash

# Nome dello script: setup_and_run.sh

# == Funzione per verificare se una variabile d'ambiente è dichiarata ==
check_env_var() {
    if [ -z "${!1}" ]; then
        echo "Errore: la variabile d'ambiente $1 non è dichiarata."
        exit 1
    fi
}

# == Setting up your environment ==

# Creazione di un virtual environment
python -m venv neoflix

# Attivazione del virtual environment
source neoflix/bin/activate

# Installazione di python-dotenv se necessario
pip install python-dotenv
pip install -r requirements.txt

# Creazione del file test_env.py per caricare e verificare le variabili d'ambiente dal file .env
cat << 'EOF' > test_env.py
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
EOF

# Esecuzione del file test_env.py per verificare le variabili d'ambiente
python test_env.py

# Esportazione delle variabili d'ambiente necessarie per Flask
export FLASK_APP=api
export FLASK_ENV=development

# Verifica se le variabili d'ambiente richieste sono dichiarate
check_env_var FLASK_APP
check_env_var FLASK_ENV

# == Running the Application ==
flask run
