from django import forms
from bankhospital.models import Bank
 
class SearchForm(forms.Form):
    search = forms.CharField(label=(''),max_length=100)
    
class RegisterForm(forms.ModelForm):
    class Meta:
        model = Bank