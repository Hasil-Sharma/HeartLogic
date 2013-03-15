from django.contrib import admin
from bloodrequest.models import Request

class RequestAdmin(admin.ModelAdmin):
    pass

admin.site.register(Request)