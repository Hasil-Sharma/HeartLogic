'''
Created on 11-Mar-2013

@author: Aayush
'''
from django.conf.urls.defaults import patterns, url
from django.contrib.auth.views import login, logout
from useraccounts.view import profile
urlpatterns = patterns('',
               url(r'login/$', login, {'template_name':'registration/login.htm'}),
               url(r'logout/$', logout),
               url(r'profile/$', profile),
               )