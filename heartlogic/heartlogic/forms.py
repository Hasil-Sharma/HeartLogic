from django import forms
from bankhospital.models import Bank
 
class SearchForm(forms.Form):
    search = forms.CharField(label=(''),max_length=100)
    
class RegisterForm(forms.ModelForm):
#    uid = forms.CharField(max_length = 100)
#    type = forms.CharField(max_length = 10)
#    name = forms.CharField(max_length = 100)
#    username = forms.CharField(max_length = 10)
#    phone_no = forms.IntegerField()
#    street_one = forms.CharField(max_length = 100)
#    street_two = forms.CharField(max_length = 100)
#    pin = forms.IntegerField()
#    state = forms.CharField(max_length = 10)
#    
    password = forms.CharField(max_length= 10 , widget = forms.PasswordInput())
    class Meta:
        model = Bank