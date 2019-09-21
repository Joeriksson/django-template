from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    # django admin
    path('admin/', admin.site.urls),
    # user management
    path('accounts/', include('django.contrib.auth.urls')),
    # local apps
    path('accounts/', include('users.urls')),
    path('', include('pages.urls'))
]
