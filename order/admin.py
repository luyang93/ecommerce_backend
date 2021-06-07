from django.contrib import admin

from .models import Order, OrderItem


class OrderAdmin(admin.ModelAdmin):
    list_display = ['user', 'last_name', 'first_name']


admin.site.register(Order, OrderAdmin)
