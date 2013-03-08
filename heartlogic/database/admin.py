from django.contrib import admin
from database.models import PagesContent, State

class PageAdmin(admin.ModelAdmin):
    list_display = ('name','link','content')
    
class StateAdmin(admin.ModelAdmin):
    pass

admin.site.register(PagesContent, PageAdmin)
admin.site.register(State, StateAdmin)