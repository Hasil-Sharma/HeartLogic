from django.conf.urls.defaults import patterns, url
from individualrequest.views import registerform

urlpatterns = patterns('',
            url(r'registerform/$', registerform),
             )