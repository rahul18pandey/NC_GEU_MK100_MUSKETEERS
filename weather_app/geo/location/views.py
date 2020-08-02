from django.shortcuts import render
from django.http import HttpResponse
import requests

# Create your views here.


def home(request):
    if request.method == 'GET':
        city = request.GET.get('location')
        if city:
            # city = request.GET.get('location')
            params = {
                'access_key': 'c921de4b8028e4add883c9ce6ea94449',
                'query': city
            }
            api_result = requests.get(
                'http://api.weatherstack.com/current', params)
            api_response = api_result.json()
            weather_data = {
                'location': api_response['location']['name'],
                'temperature': api_response['current']['temperature'],
                'condition': api_response['current']['weather_descriptions'][0]
            }
            return render(request, 'weather.html', {'weather_data': weather_data})
        else:
            params = {
                'access_key': 'c921de4b8028e4add883c9ce6ea94449',
                'query': 'Allahabad'
            }
            api_result = requests.get('http://api.weatherstack.com/current', params)
            api_response = api_result.json()
            weather_data = {
                'location': api_response['location']['name'],
                'temperature': api_response['current']['temperature'],
                'condition': api_response['current']['weather_descriptions'][0]
            }

            return render(request, 'weather.html', {'weather_data': weather_data})

    else:
        params = {
            'access_key': 'c921de4b8028e4add883c9ce6ea94449',
            'query': 'Allahabad'
        }
        api_result = requests.get(
            'http://api.weatherstack.com/current', params)
        api_response = api_result.json()
        weather_data = {
            'location': api_response['location']['name'],
            'temperature': api_response['current']['temperature'],
            'condition': api_response['current']['weather_descriptions'][0]
        }

        return render(request, 'weather.html', {'weather_data': weather_data})
