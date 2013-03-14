'''
Created on 11-Mar-2013

@author: Aayush
'''
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from useraccounts.forms import RequestForm
from django.template import RequestContext
from bankhospital.models import Bank
from datetime import date

def id_generator(bldgrpid, units):
    r_id = ''
    r_id += str(date.today().year)
    if len(str(date.today().month)) == 1:
        r_id += ('0' + str(date.today().month))
    else:
        r_id += str(date.today().month)
    if len(str(date.today().day)) == 1:
        r_id += ('0' + str(date.today().day))
    else:
        r_id += str(date.today().day)
    r_id += str(bldgrpid)
    return r_id
    
@login_required
def profile(request):
    dictionary = {}
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))
 
@login_required
def add_request(request):
    dictionary = {}
    if request.method == "POST":
        input_data = RequestForm(request.POST)
        dictionary['input_data'] = input_data
        if input_data.is_valid():
            input_data_model = input_data.save(commit = False)
            input_data_model.request_added_by_bank = Bank.objects.get(username_b = request.user.username).uid
            input_data_model.uid = id_generator(input_data_model.blood_groups.id, input_data_model.units_of_blood_req)
            a = input_data_model.blood_groups.id
            print a
            input_data_model.save()
            print "Model Saved"
            return render_to_response('sample.htm')
            
    else:
        dictionary['input_data'] = RequestForm()
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))