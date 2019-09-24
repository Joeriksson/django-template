from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

from . import views

urlpatterns = [
                  # django admin
                  path('admin/', admin.site.urls),
                  # user management
                  path('accounts/', include('allauth.urls')),
                  path('user_profile/<int:pk>', views.UserUpdate.as_view(), name='user_edit'),
                  # local apps
                  path('', include('pages.urls'))
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        path('__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
