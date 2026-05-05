def userinfo(claims, user):
    claims['name'] = f'{user.first_name} {user.last_name}'.strip(
    ) or user.username
    claims['email'] = user.email
    claims['preferred_username'] = user.username
    return claims
