'''
Created on 11-Mar-2013

@author: Aayush
'''
from django.conf.urls.defaults import patterns, url
from django.contrib.auth.views import login, logout, password_change, password_change_done
from useraccounts.views import profile, add_request, get_request, show_statistics, add_statistics, get_fullfiled_request
from useraccounts.forms import UserLoginForm, PasswordChange
urlpatterns = patterns('',
               url(r'login/$', login, {'authentication_form': UserLoginForm }),
               url(r'logout/$', logout),
               url(r'profile/$', profile),
               url(r'fullfiledrequest/$', get_fullfiled_request),
               url(r'request/$', add_request),
               url(r'requestget/$', get_request),
               url(r'bloodstatistic/$', show_statistics),
               url(r'add_statistics/$', add_statistics),
               url(r'password_change/$', password_change, {'password_change_form': PasswordChange}),
               url(r'password_change_done/$',password_change_done),
               )