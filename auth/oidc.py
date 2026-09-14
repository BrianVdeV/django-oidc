# auth/validators.py
from oauth2_provider.oauth2_validators import OAuth2Validator


class CustomOAuth2Validator(OAuth2Validator):
    def get_additional_claims(self, request):
        """Añade claims al token de identidad (ID Token)"""
        return {
            "email": request.user.email,
            "name": request.user.get_full_name() or request.user.username,
        }

    def get_userinfo_claims(self, request):
        """Añade claims al endpoint /userinfo"""
        claims = super().get_userinfo_claims(request)
        claims["email"] = request.user.email
        claims["name"] = request.user.get_full_name() or request.user.username
        return claims
