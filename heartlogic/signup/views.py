'''
Created on 10-Mar-2013

@author: Aayush
'''
import account.views
from signup.forms import SignupForm

class SignupView(account.views.SignupView):
    form_class = SignupForm
    def after_signup(self, form):
        self.create_profile(form)
        super(SignupView, self).after_signup(form)
        
    def create_profile(self, form):
        profile = self.created_user.get_profile()
        profile.birthdate = form.cleaned_data["birthdate"]
        profile.save()

