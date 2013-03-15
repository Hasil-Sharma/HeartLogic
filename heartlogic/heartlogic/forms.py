from django import forms
from bankhospital.models import Bank
from volunteer.models import Volunteer
from django.forms.extras import SelectDateWidget

class SearchForm(forms.Form):
    search = forms.CharField(label=('Enter City'),max_length=100)

class RegisterForm(forms.ModelForm):
    class Meta:
        model = Bank
        exclude = ('username_b',)

class VolunteerForm(forms.ModelForm):
    last_time_donated = forms.DateField(widget = SelectDateWidget())
    class Meta:
        model = Volunteer