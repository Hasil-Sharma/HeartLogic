'''
Created on 11-Mar-2013

@author: Aayush
'''
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from useraccounts.forms import RequestForm, CampForm
from django.template import RequestContext
from bankhospital.models import Bank, Camp
from bloodrequest.models import Request
from bloodgroup.models import BloodGroup, Blood
from datetime import date
import cPickle

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
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))
 
@login_required
def add_request(request):
    dictionary = {}
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    if request.method == "POST":
        input_data = RequestForm(request.POST)
        dictionary['input_data'] = input_data
        if input_data.is_valid():
            input_data_model = input_data.save(commit = False)
            input_data_model.request_added_by_bank = Bank.objects.get(username_b = request.user.username).uid
            input_data_model.uid = id_generator(input_data_model.blood_groups.id, input_data_model.units_of_blood_req)
            input_data_model.save()
            print "Model Saved"
            dictionary['request_saved']= True
            
    else:
        dictionary['input_data'] = RequestForm()
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))

@login_required
def get_request(request):
    dictionary = {}
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    if request.method == "POST":
        if request.POST['operation'] == "Delete This":
            req = Request.objects.get(pk = request.POST['req_id'])
            req.delete()
        else:
            req = Request.objects.get(pk = request.POST['req_id'])
            req.fullfiled = 1
            print req.fullfiled
            req.fullfiled_by = Bank.objects.get(username_b = request.user).username_b
            print req.fullfiled_by
            req.save()
    requests = Request.objects.filter(fullfiled = False)
    dictionary['pending_requests'] = requests
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))

@login_required
def show_statistics(request):
    dictionary = {}
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    dictionary['blood_statistic'] = True
    dictionary['blood_groups'] = BloodGroup.objects.all()
    try:
        pickled_data = str(Blood.objects.get(bank = Bank.objects.get(username_b = str(request.user))).group)
        print str(pickled_data)
        dictionary['statistics'] = dict(cPickle.loads(pickled_data))
        print dictionary['statistics']
    except:
        pass
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))


@login_required
def add_statistics(request):
    dictionary = {}
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    if request.method == "POST":
        content = {}
        dictionary['blood_groups'] = BloodGroup.objects.all()
        for blood in dictionary['blood_groups']:
            blood = str(blood)
            content[blood] = request.POST[blood]
        pickledata = cPickle.dumps(content)
        user = str(request.user)
        try:
            stat = Blood(bank = Bank.objects.get(username_b = user), group = pickledata)
            stat.save()
        except:
            stat = Blood.objects.get(bank = Bank.objects.get(username_b = user))
            stat.group = pickledata
            stat.save()
        print "model saved"
        
    else:
        dictionary['add_stat'] = True
        dictionary['blood_groups'] = BloodGroup.objects.all()
    dictionary['bloodbank'] = True
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))
    

@login_required
def get_fullfiled_request(request):
    dictionary = {}
    if Bank.objects.get(username_b = request.user).type == 0:
        dictionary['bloodbank'] = True
    else:
        dictionary['hospital'] = True
    requests = Request.objects.filter(fullfiled = 1)
    dictionary['pending_requests'] = requests
    dictionary["hidden"] = True
    return render_to_response('interface/profile.htm', dictionary, context_instance=RequestContext(request))