import os
import requests
from django.http import HttpResponse
from dotenv import load_dotenv

def hello(request):
    addr = os.environ.get("API_SERVER_ADDRESS")
    port = os.environ.get("API_SERVER_PORT")
    
    print(f"api server address: {addr}")
    print(f"api server port: {port}")

    response = requests.get(f'http://{addr}:{port}/env')
    return HttpResponse(response)
