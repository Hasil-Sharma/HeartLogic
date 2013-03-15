from django.shortcuts import render_to_response
from django.template import RequestContext
from database.models import PagesContent
#from django.http import HttpResponseRedirect, Http404
from heartlogic.forms import SearchForm, RegisterForm, VolunteerForm
from bankhospital.models import Camp, Bank
from volunteer.models import Volunteer 
from django.contrib.auth.forms import UserCreationForm
def standard():
    dictionary = {}
    return dictionary

#def writeup(request, name = 'home'):
#    dictionary = standard()
#    dictionary['writeup']=PagesContent.objects.get(link=name).content
#    return dictionary

def result_b(request):
    dictionary = standard()
    dictionary['error'] = False
    bank_form = SearchForm(request.POST)
    if bank_form.is_valid():
        search_city = bank_form.cleaned_data['search']
        dictionary['search_result'] = Bank.objects.filter(address_city = search_city)
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
        dictionary['search_result'] = Camp.objects.filter(address_city = search_city)
        print dictionary['search_result']
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
    dictionary = standard()
    dictionary['writeup']=PagesContent.objects.get(link=name)
    dictionary['bank_form'] = SearchForm()
    dictionary['camp_form'] = SearchForm()
    return render_to_response('content.htm',dictionary,context_instance=RequestContext(request))

def registerform(request):
    dictionary = standard()
    if request.method == "POST":
        input_data = RegisterForm(request.POST)
        input_data_u = UserCreationForm(request.POST)
        dictionary['input_data'] = input_data
        dictionary['input_data_u'] = input_data_u
        if input_data.is_valid() and input_data_u.is_valid():
            input_data_u.save()
            input_data_model = input_data.save(commit = False)
            input_data_model.username_b =  input_data_u.cleaned_data['username']
            input_data_model.save()
            dictionary['success'] = True
            dictionary['username'] = input_data_u.cleaned_data['username']
    else:
        dictionary['input_data'] = RegisterForm()
        dictionary['input_data_u'] = UserCreationForm()
        dictionary['value'] = "Register"
    return render_to_response('register.htm',dictionary,context_instance=RequestContext(request))

def volunteerform(request):
    dictionary = standard()
    if request.method == "POST":
        input_data = VolunteerForm(request.POST)
        dictionary['input_data'] = input_data
        if input_data.is_valid():
            try:
                Volunteer.objects.get(uid = input_data.cleaned_data['uid'])
                dictionary['registered'] = True
                return render_to_response('registration/volunteer.htm', dictionary, context_instance=RequestContext(request))
            except:
                input_data.save()
                print "saved"
                print input_data.cleaned_data.values()
                dictionary['success'] = True
                return render_to_response('registration/volunteer.htm', dictionary, context_instance=RequestContext(request))
        else:
            return render_to_response('registration/volunteer.htm', dictionary, context_instance=RequestContext(request))
    else:
        dictionary['input_data'] = VolunteerForm()
    return render_to_response('registration/volunteer.htm', dictionary, context_instance=RequestContext(request))


