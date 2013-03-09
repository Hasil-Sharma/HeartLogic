from django.shortcuts import render_to_response
from django.template import RequestContext
from database.models import PagesContent
#from django.http import HttpResponseRedirect, Http404
from heartlogic.forms import BankSearchForm, CampSearchForm
from bankhospital.models import Camp, Bank

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

def mainpage(request):
    dictionary = standard()
    if request.method == 'POST':
        bank_form = BankSearchForm(request.POST)
        camp_form = CampSearchForm(request.POST)
        if bank_form.is_valid():
            search_city = bank_form.cleaned_data['address_city']
            dictionary['search_result'] = Bank.objects.filter(address_city__contains = search_city)
            return render_to_response('mainpage.htm',dictionary,context_instance=RequestContext(request))

        elif camp_form.is_valid():
            search_city = camp_form.cleaned_data['address_city']
            dictionary['search_result'] = Camp.objects.filter(address_city__contains = search_city)
            return render_to_response('mainpage.htm',dictionary,context_instance=RequestContext(request))
            
    else:
        dictionary['bank_form'] = BankSearchForm()
        dictionary['camp_form'] = CampSearchForm()
    return render_to_response('mainpage.htm',dictionary,context_instance=RequestContext(request))