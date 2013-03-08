from django.contrib import admin
from individualrequest.models import IndividualRequest

class IndividualRequestAdmin(admin.ModelAdmin):
    pass

admin.site.register(IndividualRequest, IndividualRequestAdmin)