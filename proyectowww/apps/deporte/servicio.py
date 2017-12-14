from django.conf import settings
settings.configure()

from models import usuarioEvento
from models import noticia
from models import evento
from models import usuario
from .models import actividades


import json
from urllib.request import urlopen



response = urlopen("https://hmrsoftware.com/abeventos/servicio.php").read().decode('utf8')
obj = json.loads(response)
eventosUsuario = obj['data']

for even in eventosUsuario:
    print(even['cedula'])



ver_usuarioevento = usuarioEvento.objects.get(id_evento=1, id_usuario=2)
ver_usuarioevento.pago = True


