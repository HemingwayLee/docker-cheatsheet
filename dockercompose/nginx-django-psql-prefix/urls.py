from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url

urlpatterns = [
    path('admin/', admin.site.urls),
]

# Add prefix to all urls
urlpatterns = [url(r'^abc/v1/', include(urlpatterns))]
