'''\
Created on 14-Mar-2013

@author: Aayush
'''
from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm
from bloodrequest.models import Request
from bloodgroup.models import BloodGroup
from django import forms
class UserLoginForm(AuthenticationForm):
    pass

class PasswordChange(PasswordChangeForm):
    pass

class RequestForm(forms.ModelForm):
    
    class Meta:
        model = Request
        fields = ('blood_groups', 'units_of_blood_req', 'priority_level')
        
class StatisticForm(forms.Form):
    pass
        