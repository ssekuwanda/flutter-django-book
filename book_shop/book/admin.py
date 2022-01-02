from django.contrib import admin
from .models import Subject, Author, Publisher, Book

admin.site.register(Subject)
admin.site.register(Author)
admin.site.register(Publisher)
admin.site.register(Book)
