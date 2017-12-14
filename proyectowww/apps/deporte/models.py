from __future__ import unicode_literals
from django.db import models
#from django.forms import forms
from django.contrib.auth.models import User
from django.forms import ModelForm, Textarea, DateInput, TextInput, PasswordInput, EmailInput, Select, FileField
from django.conf import settings


class noticia(models.Model):
    titulo = models.CharField(max_length=200)
    copete = models.CharField(max_length=200)
    cuerpo = models.TextField(max_length=10000)
    autor = models.CharField(max_length=200)
    fecha = models.DateTimeField('date published')
    imagen = models.FileField(upload_to ='img', null=True, blank=True)
    estado = models.BooleanField(default = True)
    
    def __str__(self):
        return self.titulo
        
class noticiaForm(ModelForm):
    class Meta:
        model = noticia
        fields = ['imagen', 'titulo','copete','fecha', 'autor', 'cuerpo', 'estado']
        widgets = {
            'titulo': TextInput(attrs={'id': 'icon_prefix', 'class':'validate', 'required':'required'}),
            'copete': TextInput(attrs={'id': 'icon_prefix', 'class':'validate', 'required':'required'}),
            'fecha': TextInput(attrs={'id': 'icon_prefix', 'class':'datepicker', 'required':'required'}),
            'autor': TextInput(attrs={'id': 'icon_prefix', 'class':'autocomplete validate', 'required':'required'}),
            'cuerpo': Textarea(attrs={'id': 'textareaCuerpoNoticia', 'class':'materialize-textarea validate', 'data-length':'420000'}),
        }


class evento(models.Model):
    titulo = models.CharField(max_length=200)
    imagen = models.FileField(upload_to ='img', null=True, blank=True)
    fechaInicio = models.DateField()
    restriccion = models.CharField(max_length=200)
    encargado = models.CharField(max_length=200)
    hora = models.TimeField()
    costo = models.IntegerField()
    participante = models.IntegerField()
    descripcion = models.TextField(max_length=10000)
    lugar = models.CharField(max_length=200)
    ciudad = models.CharField(max_length=200)
    tipo_deporte = models.CharField(max_length=200, default="Futbol")
    estado = models.BooleanField()
    
    def __str__(self):
        return self.titulo

class eventoForm(ModelForm):
    class Meta:
        model = evento
        fields = ['titulo', 'fechaInicio','restriccion', 'encargado', 'hora', 'costo', 'participante', 'lugar', 'ciudad', 'tipo_deporte', 'estado','descripcion', 'imagen']

# Create your models here.
class actividades(models.Model):
    nombre = models.CharField(max_length=200)
    id_evento = models.ForeignKey(evento, on_delete=models.CASCADE)
    fechaInicio = models.DateField()
    horaInicio = models.TimeField()
    horaFinal = models.TimeField()
    estado = models.BooleanField()

class actividadesForm(ModelForm):
    class Meta:
        model = actividades
        fields = ['nombre', 'id_evento', 'fechaInicio', 'horaInicio', 'horaFinal', 'estado']



class usuario(models.Model):
    user = models.ForeignKey(User)
    #nombres = models.CharField(max_length=200)
    #apellidos = models.CharField(max_length=200)
    #nickname = models.CharField(max_length=200)
    #contraseña = models.CharField(max_length=200)
    foto = models.FileField(upload_to ='img', null=True, blank=True)
    #email = models.CharField(max_length=200)
    fechaNacimiento = models.DateTimeField('date published')
    genero = models.CharField(max_length=200)
    rol = models.CharField(max_length=200)
    #estado = models.BooleanField(default = True)
    
    def __str__(self):
        return self.user.first_name + " " + self.user.last_name + " [" + self.user.username + "]"

class registroUsuarioForm(ModelForm):
    class Meta:
        model = usuario
        fields = ['user', 'foto', 'fechaNacimiento', 'genero', 'rol']


class registroUserForm(ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'password', 'email']


class usuarioEvento(models.Model):
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    id_evento = models.ForeignKey(evento, on_delete=models.CASCADE)
    pago = models.BooleanField(default = False)
    estado = models.CharField(max_length=130, default="Pre-inscrito")
    
    def __str__(self):
        return self.id_usuario.username + " - " + self.id_evento.titulo