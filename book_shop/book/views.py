from django.shortcuts import render
from rest_framework import generics
from .models import Book, Subject, Author
from .serializers import BookSerialiser


class BookListView(generics.ListAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerialiser
