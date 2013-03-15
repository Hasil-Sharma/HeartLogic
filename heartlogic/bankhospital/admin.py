from django.contrib import admin
from bankhospital.models import Bank, Camp

class BankAdmin(admin.ModelAdmin):
    pass

class CampAdmin(admin.ModelAdmin):
    exclude = ('camp_added_by',)
    def save_model(self, request, obj, form, change):
        obj.camp_added_by = request.user
        obj.save()

admin.site.register(Bank)
admin.site.register(Camp, CampAdmin)