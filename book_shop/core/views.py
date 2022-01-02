from django.shortcuts import render
from django.http.response import HttpResponse, JsonResponse
from django.contrib.auth.models import User

def aPage(request):
    user = User.objects.get(pk=1)
    return JsonResponse({"UserName": user.username, "Email": user.email})