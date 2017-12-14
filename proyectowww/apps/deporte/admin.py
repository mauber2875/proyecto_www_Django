from django.contrib import admin

# Register your models here.

from .models import noticia
from .models import evento
from .models import usuario
from .models import usuarioEvento

admin.site.register(noticia)
admin.site.register(evento)
admin.site.register(usuario)
admin.site.register(usuarioEvento)