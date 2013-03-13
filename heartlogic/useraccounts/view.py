'''
Created on 11-Mar-2013

@author: Aayush
'''
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response

@login_required
def profile(request):
    dictionary = {}
   # dictionary['user_authentication'] = request.user.is_authenticated()
  #  dictionary['user_name'] = request.user.username
    return render_to_response('interface/profile.htm',dictionary)
