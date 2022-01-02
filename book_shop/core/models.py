from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend, UserModel
from django.contrib.auth.models import AbstractUser
from django.db import models


# class User(AbstractUser):
#     email = models.EmailField(unique=True)


# class EmailBackend(ModelBackend):

#     def authenticate(self, request, username=None, password=None, **kwargs):
#         UserModel = get_user_model()
#         try:
#             user = UserModel.objects.get(username=username)
#         except UserModel.DoesNotExist:
#             try:
#                 user = UserModel.objects.get(email=username)
#             except UserModel.DoesNotExist:
#                 UserModel().set_password(password)
#             else:
#                 if user.check_password(password) and self.user_can_authenticate(user):
#                     return user
#         else:
#             if user.check_password(password) and self.user_can_authenticate(user):
#                 return user
