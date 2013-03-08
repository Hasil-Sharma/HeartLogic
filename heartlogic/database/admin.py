from django.contrib import admin
from database.models import *

class PageAdmin(admin.ModelAdmin):
    list_display = ('name','link','content')

admin.site.register(PagesContent, PageAdmin)
admin.site.register(State)