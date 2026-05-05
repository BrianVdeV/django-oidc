from django.shortcuts import render
from django.views import View


class LoginView(View):
    """Vista de inicio de sesión."""
    template_name = "login.html"

    def get(self, request):
        return render(request, self.template_name)
