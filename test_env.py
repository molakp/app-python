import os
from dotenv import load_dotenv

# Carica le variabili d'ambiente dal file .env
load_dotenv()

# Ora le variabili d'ambiente sono disponibili tramite os.getenv
flask_app = os.getenv('FLASK_APP')
flask_debug = os.getenv('FLASK_DEBUG')
flask_run_port = os.getenv('FLASK_RUN_PORT')
neo4j_uri = os.getenv('NEO4J_URI')
neo4j_username = os.getenv('NEO4J_USERNAME')
neo4j_password = os.getenv('NEO4J_PASSWORD')
jwt_secret = os.getenv('JWT_SECRET')
salt_rounds = int(os.getenv('SALT_ROUNDS'))

# Esempio di utilizzo
print(f"FLASK_APP: {flask_app}")
print(f"JWT_SECRET: {jwt_secret}")
