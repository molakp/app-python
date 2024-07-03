#!/bin/bash

# Nome dello script: setup_and_run.sh

# == Setting up your environment ==

# Creazione di un virtual environment
python -m venv neoflix

# Attivazione del virtual environment
source neoflix/bin/activate

# Installazione delle dipendenze del progetto (se hai un requirements.txt, ad esempio)
# pip install -r requirements.txt

# Caricamento delle variabili d'ambiente dal file .env (richiede python-dotenv)
cat << 'EOF' > test_env.py
import os
from dotenv import load_dotenv

# Carica le variabili d'ambiente dal file .env
load_dotenv()

# Verifica se la variabile JWT_SECRET è presente
if 'JWT_SECRET' in os.environ:
    print(f"JWT_SECRET è impostata: {os.environ['JWT_SECRET']}")
else:
    print("JWT_SECRET non è impostata")
EOF

python test_env.py

# Esportazione delle variabili d'ambiente necessarie per Flask
export FLASK_APP=api
export FLASK_ENV=development

# == Running the Application ==
flask run
