from django.urls import path, include
from . import views

urlpatterns = [
    path("login/", views.LoginView.as_view(), name="login"),
    path('openid/', include('oidc_provider.urls', namespace='oidc_provider')),
]
