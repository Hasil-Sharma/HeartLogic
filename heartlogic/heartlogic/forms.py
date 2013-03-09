from django import forms
from bankhospital.models import Bank, Camp

class BankSearchForm(forms.ModelForm):
    class Meta:
        model = Bank
        fields = ('name','address_street_one','address_street_two','address_city','address_state','address_pin')

class CampSearchForm(forms.ModelForm):
    class Meta:
        model = Camp
        fields = ('address_city',)