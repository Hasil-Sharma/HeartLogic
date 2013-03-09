from django import forms
from bankhospital.models import Bank, Camp

class BankSearchForm(forms.ModelForm):
    class Meta:
        model = Bank
        fields = ('address_city',)

class CampSearchForm(forms.ModelForm):
    class Meta:
        model = Camp
        fields = ('address_city',)