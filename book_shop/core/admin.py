from django.contrib import admin
# from .models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin


# @admin.register(User)
# class UserAdmin(BaseUserAdmin):
#     list_display = ('username', 'email', 'is_staff',
#                     'is_active', 'is_superuser')
#     list_filter = ('is_staff', 'is_superuser')
#     fieldsets = (
#         (None, {'fields': ('username', 'password')}),
#         ('Personal info', {'fields': ('first_name', 'last_name', 'email')}),
#         ('Permissions', {'fields': ('is_staff', 'is_active', 'is_superuser')}),
#     )
#     add_fieldsets = (
#         (None, {
#             'classes': ('wide',),
#             'fields': ('username', 'password1', 'password2', 'is_staff', 'is_active', 'is_superuser')}
#          ),
#     )
#     search_fields = ('username', 'email')
#     ordering = ('username',)
#     filter_horizontal = ()
