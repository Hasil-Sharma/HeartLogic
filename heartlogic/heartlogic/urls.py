from heartlogic import settings
from django.conf.urls import patterns, include, url
from database.views import *
from heartlogic.views import result_b, result_c, notfound, home, writeup, registerform
from django.contrib import admin
import useraccounts.urls
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^accounts/', include(useraccounts.urls)),
    url(r'^$', home, {}),
    url(r'^result_b/$', result_b),
    url(r'^result_c/$', result_c),
    url(r'^faq/$',home,{'name':'faq'}),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^register/$', registerform),
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    url(r'^(?P<name>[-\w]+)/$', writeup, {}),
    #url(r'^accounts/profile/$', home, {}),

)


handler404 = notfound
handler500 = notfound
handler403 = notfound