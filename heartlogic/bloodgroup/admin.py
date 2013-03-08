from django.contrib import admin
from bloodgroup.models import BloodGroup, Blood

class BloodGroupAdmin(admin.ModelAdmin):
    pass

class BloodAdmin(admin.ModelAdmin):
    pass

admin.site.register(BloodGroup,BloodGroupAdmin)
admin.site.register(Blood,BloodAdmin)