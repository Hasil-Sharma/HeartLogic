from django.shortcuts import render_to_response
from django.template import RequestContext
from database.models import PagesContent
#from django.http import HttpResponseRedirect, Http404
from heartlogic.forms import SearchForm
from bankhospital.models import Camp, Bank
def standard():
    dictionary = {}
    return dictionary

def writeup(request, name = 'home'):
    dictionary = standard()
    dictionary['writeup']=PagesContent.objects.get(link=name).content
    return dictionary

def result_b(request):
    dictionary = standard()
    dictionary['error'] = False
    bank_form = SearchForm(request.POST)
    if bank_form.is_valid():
        search_city = bank_form.cleaned_data['search']
        dictionary['search_result'] = Bank.objects.filter(address_city__contains = search_city)
    else:
        dictionary['error'] = True
    dictionary['bank_form'] = SearchForm()
    dictionary['camp_form'] = SearchForm()
    dictionary['object_type']= 'Blood Bank'
    return render_to_response('result.htm',dictionary,context_instance=RequestContext(request))
        
def result_c(request):
    dictionary = standard()
    dictionary['error'] = False
    camp_form = SearchForm(request.POST)
    if camp_form.is_valid():
        search_city = camp_form.cleaned_data['search']
        dictionary['search_result'] = Camp.objects.filter(address_city__contains = search_city)
    else:
        dictionary['error'] = True
    dictionary['bank_form'] = SearchForm()
    dictionary['camp_form'] = SearchForm()
    dictionary['object_type']= 'Blood Camps'
    return render_to_response('result.htm',dictionary,context_instance=RequestContext(request))
 
        
def notfound(request):
    dictionary = standard()
    return render_to_response('404.htm',dictionary,context_instance=RequestContext(request))

def home(request, name = 'home'):
    dictionary = writeup(request,name)
    dictionary['bank_form'] = SearchForm()
    dictionary['camp_form'] = SearchForm()
    return render_to_response('home.htm',dictionary,context_instance=RequestContext(request))