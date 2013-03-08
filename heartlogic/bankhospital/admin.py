from django.contrib import admin
from bankhospital.models import Bank, Camp

class BankAdmin(admin.ModelAdmin):
    pass

class CampAdmin(admin.ModelAdmin):
    pass

admin.site.register(Bank)
admin.site.register(Camp)