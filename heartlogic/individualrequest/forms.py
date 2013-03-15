'''
Created on 15-Mar-2013

@author: Aayush
'''
from django import forms
from individualrequest.models import IndividualRequest

class IndividualRequestForm(forms.ModelForm):
    class Meta:
        model = IndividualRequest