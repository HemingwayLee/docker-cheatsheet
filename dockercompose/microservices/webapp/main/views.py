import os
import requests
from django.http import HttpResponse, JsonResponse
from dotenv import load_dotenv

def hello(request):
    addr = os.environ.get("API_SERVER_ADDRESS")
    port = os.environ.get("API_SERVER_PORT")
    
    print(f"api server address: {addr}")
    print(f"api server port: {port}")

    response = {
        "web_server_name": os.environ.get('FOOBAR', 'No env'),
        "res_from_api_server": requests.get(f'http://{addr}:{port}/env').json()
    }

    return JsonResponse(response, safe=False)
