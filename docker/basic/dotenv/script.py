import os
from dotenv import load_dotenv

load_dotenv(".env")
print(f"inside python: {os.environ.get('WEBADDRESS')}")

