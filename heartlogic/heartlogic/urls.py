from heartlogic import settings
from django.conf.urls import patterns, include, url, defaults
from database.views import *
from heartlogic.views import *
import signup.forms
from signup.views import SignupView
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', writeup, {}),
    url(r'^home$',mainpage),
    #Other urls come here
    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    #static pages' urls come here
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',  
     {'document_root': settings.MEDIA_ROOT}),
    url(r'^(?P<name>[-\w]+)/$', writeup, {}),
    url(r"^account/signup/$", SignupView.as_view(), name="account_signup"),
    url(r'^account/',include("account.urls")),
)


handler404 = notfound
handler500 = notfound
handler403 = notfound