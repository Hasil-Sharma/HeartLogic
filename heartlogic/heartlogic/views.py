from django.shortcuts import render_to_response
from django.template import RequestContext
from database.models import *
from database.views import *
from django.http import HttpResponseRedirect, Http404
import os
import datetime

def standard():
    dictionary = {}
    return dictionary

def writeup(request, name = 'home'):
    dictionary = standard()
    dictionary['writeup']=PagesContent.objects.get(link=name)
    return render_to_response('content.htm',dictionary,context_instance=RequestContext(request))

def notfound(request):
    dictionary = standard()
    return render_to_response('404.htm',dictionary,context_instance=RequestContext(request))