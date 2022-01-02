from rest_framework import serializers
from .models import Subject, Book


class SubjectSerialisers(serializers.Serializer):
    class Meta:
        model = Subject


class BookSerialiser(serializers.ModelSerializer):
    author = serializers.StringRelatedField()
    publisher = serializers.StringRelatedField()
    subject = serializers.StringRelatedField()

    class Meta:
        model = Book
        fields = ["id", "name", "price", "discount",
                  "author", "publisher", "image", "preview", "subject", "last_sold"]
