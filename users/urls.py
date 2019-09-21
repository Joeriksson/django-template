from django.urls import path

from .views import SignupPageView

urlpatterns = [
    path('signup/', SignupPageView, name='signup'),
]
