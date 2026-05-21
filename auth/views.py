from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.views import View


class LoginView(View):
    """Vista de inicio de sesión."""
    template_name = "login.html"

    def get(self, request):
        if request.user.is_authenticated:
            return redirect('https://conoce.planosperu.com.pe/')
        return render(request, self.template_name)

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('https://conoce.planosperu.com.pe/')
        else:
            messages.error(request, "Usuario o contraseña incorrectos.")
            return render(request, self.template_name)


class LogoutView(View):
    """Vista de cierre de sesión."""

    def get(self, request):
        logout(request)
        return redirect('login')
