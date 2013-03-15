# Create your views here.
from django.shortcuts import render_to_response
from individualrequest.forms import IndividualRequestForm
from django.template import RequestContext
from django.http import HttpResponseRedirect
def registerform(request):
    dictionary = {}
    if request.method == "POST":
        input_data = IndividualRequestForm(request.POST)
        dictionary['input_data'] = input_data
        if input_data.is_valid():
            input_data.save()
            print "Individual Request Saved"
            return HttpResponseRedirect('/home/')
    else:
        dictionary['input_data'] = IndividualRequestForm()
    dictionary['success'] = False
    dictionary['value'] = "Submit"
    return render_to_response('register.htm', dictionary, context_instance=RequestContext(request))