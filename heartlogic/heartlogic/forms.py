from django import forms
from bankhospital.models import Bank
from volunteer.models import Volunteer
from django.forms.extras import SelectDateWidget
from django.contrib.auth.forms import UserCreationForm

class SearchForm(forms.Form):
    search = forms.CharField(label=(''),max_length=100)
    
class RegisterForm(UserCreationForm):
#    def __init__(self, *args, **kwargs):
#        super(RegisterForm, self).__init__(*args, **kwargs)
#        self.fields.keyOrder = ['uid', 'type', 'name', 'phone_no',
#                                'email_id', 'address_street_one',
#                                'address_street_two', 'address_city',
#                                'address_state', 'address_pin', 'username',
#                                'password1','password2']
        
#    def save(self, commit=True):
#        user = super(RegisterForm, self).save(commit=True)
#        bank = Bank(uid= self.cleaned_data['uid'], type = self.cleaned_data['type'])
#        bank.save()
#        return user, user_profile
#    
    class Meta:
        model = Bank
        exclude = ('username_b',)
class VolunteerForm(forms.ModelForm):
    last_time_donated = forms.DateField(widget = SelectDateWidget())
    class Meta:
        model = Volunteer