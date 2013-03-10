from heartlogic import settings
from django.conf.urls import patterns, include, url
from database.views import *
from heartlogic.views import result_b, result_c, notfound, home, writeup
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', home, {}),
    url(r'^result_b/$', result_b),
    url(r'^result_c/$', result_c),
    url(r'^faq/$',home,{'name':'faq'}),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    url(r'^(?P<name>[-\w]+)/$', writeup, {}),
)


handler404 = notfound
handler500 = notfound
handler403 = notfound