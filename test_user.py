import os
from neo4j.exceptions import Neo4jError

import pytest

from api.dao.auth import AuthDAO
from api.neo4j import get_driver

email = "graphacademy@neo4j.com"
password = "letmein"
name = "Graph Academy"
with app.app_context():
    driver = get_driver()

    dao = AuthDAO(driver, os.environ.get('JWT_SECRET'))
    assert dao is not ""
    assert dao is not None
    user = dao.register(email, password, name)
    
    assert user["userId"] is not None
    assert user["name"] == name
    assert "password" not in user
    assert user["userId"] is not None
    assert user["token"] is not None