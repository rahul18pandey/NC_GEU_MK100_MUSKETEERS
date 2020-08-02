from django.shortcuts import render
from twilio.rest import Client

# Create your views here.
account_sid = 'ACd6ffda32e87015a7441f8fac5b235102'
auth_token = '2fedd09f5d0fbe7cd23bea69ff16e533'


def message(request):
    if request.method == 'GET':
        price = request.GET.get('price')
        reciever = request.GET.get('reciever')
        client = Client(account_sid, auth_token)
        final_message = 'Congratulation , you have the bidding of Rs'+price+'.'

        message = client.messages.create(
            from_='+16143899367',
            body=final_message,
            to='+91'+reciever
        )
        msg = message.sid
        context = {
            'success': 'A Greeting message is send to your registered mobile number'
        }
        return render(request, 'msg/form.html', context)
    return render(request, 'msg/form.html')
