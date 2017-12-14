from django.shortcuts import render
from django.shortcuts import render_to_response, HttpResponseRedirect, redirect
from django.contrib.auth import authenticate, login, logout
from django.core.urlresolvers import reverse_lazy
#from django.contrib.auth.models import User
#Vistas
from .models import noticia
from .models import evento
from .models import usuario

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render

#ModelFomrs
from .models import noticiaForm
#from .models import registroUsuarioForm
#Otros
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from django.conf import settings
import datetime
from .forms import *




# Create your views here.

def index_view(request):
        index_eventos = evento.objects.all()[:6]
        index_noticias = noticia.objects.all()[:5]
        mensaje = ""
        if request.user.is_authenticated():
                #return HttpResponseRedirect('/')
                #return HttpResponse('dashboard.html')
                #return HttpResponse('estoy autenticado')
                return render(request, 'dashboard.html', {})
        else:
                if request.method == "POST":
                        #return HttpResponse('entro from valid')
                        form = LoginForm(request.POST)
                        if form.is_valid():
                                lista_usuarios = usuario.objects.all()
                                #return HttpResponse(lista_usuarios)
                                username = form.cleaned_data['username']
                                password = form.cleaned_data['password']
                                user = authenticate(username=username, password=password)
                                #return HttpResponse(password)
                                if user is not None:
                                        if user.is_active:
                                                login(request,user)
                                                usu_ide = user.id
                                                usu = User.objects.get(id=usu_ide)
                                                usu_rol = usuario.objects.get(user_id=usu)
                                                return render(request, 'dashboard.html', {'usu_rol': usu_rol})
                                        else:
                                                 
                                                 mensaje = ("El usuario %s no esta activo")%(user.username)
                                                 context = {'index_eventos':index_eventos, 'index_noticias':index_noticias, 'mensaje':mensaje}
                                                 return render(request, 'index.html', context)
                                else:
                                        mensaje = "El usuario no existe o la contraseña es incorrecta"
                                        context = {'index_eventos':index_eventos, 'index_noticias':index_noticias, 'mensaje':mensaje}
                                        return render(request, 'index.html', context)
                                     
                        else:     
                                return HttpResponse('no valido')
                else:
                        #login_F = LoginForm() # instancia del formulario
                        
                        #return HttpResponse('pru')
                        #return render_to_response('formulario-noticia.html', {'noticiaForm': noticia_F}, context_instance=RequestContext(request))
                        
                        #return render(request, 'formulario-noticia.html', {})        
                        context = {'index_eventos':index_eventos, 'index_noticias':index_noticias}
                        return render(request, 'index.html', context)
                        #return render_to_response('index.html', {'LoginForm': login_F},context_instance=RequestContext(request))

        index_eventos = evento.objects.all()[:6]
        index_noticias = noticia.objects.all()[:5]
        context = {'index_eventos':index_eventos, 'index_noticias':index_noticias}
        return render(request, 'index.html', context)


def lista_eventos_dashboard_view(request):
        #Listado de bd + Paginación eventos        
        lista_evento_dashboard = evento.objects.all()
        evento_lista = Paginator(lista_evento_dashboard, 4) # Show 25 contacts per page
        page = request.GET.get('page')
        try:
                eventos_l = evento_lista.page(page)
        except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                eventos_l = evento_lista.page(1)
        except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                eventos_l = evento_lista.page(paginator.num_pages)
        return render(request, 'lista-eventos-dashboard.html', {'eventos_l': eventos_l})      

		
def lista_usuarios_dashboard_view(request):
        #Listado de bd + Paginación usuarios        
        lista_usuario_dashboard = usuario.objects.all()
        usuario_lista = Paginator(lista_usuario_dashboard, 4) # Show 25 contacts per page
        page = request.GET.get('page')
        try:
                usuarios_l = usuario_lista.page(page)
        except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                usuarios_l = usuario_lista.page(1)
        except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                usuarios_l = usuario_lista.page(paginator.num_pages)
        return render(request, 'lista-usuarios-dashboard.html', {'usuarios_l': usuarios_l})   


def  formulario_noticia_update_view(request, id_noticia):
      #---------------------------------------------
         if request.method == 'POST':
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                noticiaSave = noticiaForm(request.POST.copy(),  request.FILES)
                noticiaSave.data['fecha'] = nuevaFecha
                
                if noticiaSave.is_valid():
                        noti = noticiaSave.update()
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        return HttpResponseRedirect('formulario_noticia')
                        #return HttpResponse(noticiaSave)
                else:
                        
                        print(noticiaSave.errors )
                        return HttpResponse(noti.errors)
         else:
                ver_noticia = noticia.objects.get(id=id_noticia)
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                f
                usu_rol = usuario.objects.get(user_id = usuActualId)
                
                return render(request, 'formulario-noticia-update.html', {'ver_noticia':ver_noticia, 'usu_rol':usu_rol})
                #return redirect(reverse_lazy('deportes:formulario-noticia-update.html'))

def  formulario_eventos_update_view(request, id_evento):
      #---------------------------------------------
         if request.method == 'POST':
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                eventoSave = eventoForm(request.POST.copy(),  request.FILES)
                eventoSave.data['fecha'] = nuevaFecha
                
                if eventoSave.is_valid():
                        noti = eventoSave.update()
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        return HttpResponseRedirect('formulario_evento')
                        #return HttpResponse(eventoSave)
                else:
                        
                        print(eventoSave.errors )
                        return HttpResponse(noti.errors)
         else:
                ver_evento = evento.objects.get(id=id_evento)
                eventoActual = request.user
                usuActualId = eventoActual.id
                
                usu_rol = evento.objects.get(user_id = usuActualId)
                
                return render(request, 'formulario-eventos-update.html', {'ver_evento':ver_evento, 'usu_rol':usu_rol})
                #return redirect(reverse_lazy('deportes:formulario-evento-update.html'))



        
def  formulario_usuario_update_view(request, id_usuario):
      #---------------------------------------------
         if request.method == 'POST':
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                usuarioSave = usuarioForm(request.POST.copy(),  request.FILES)
                usuarioSave.data['fecha'] = nuevaFecha
                
                if usuarioSave.is_valid():
                        noti = usuarioSave.update()
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        return HttpResponseRedirect('formulario_usuario')
                        #return HttpResponse(usuarioSave)
                else:
                        
                        print(usuarioSave.errors )
                        return HttpResponse(noti.errors)
         else:
                ver_usuario = usuario.objects.get(id=id_usuario)
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                
                usu_rol = usuario.objects.get(user_id = usuActualId)
                
                return render(request, 'formulario-usuario-update.html', {'ver_usuario':ver_usuario, 'usu_rol':usu_rol})
                #return redirect(reverse_lazy('deportes:formulario-usuario-update.html'))
        
        



#def guardar_evento_usuario(request, id_eve, id_usu):
#        print (id_eve)
#        print (id_usu)

def guardar_evento_usuario(request, id_eve):
        print (id_eve)
        #print (id_usu)
        usu_usu = user.id
        #usuario_lista =  usuario.objects.all().filter(id_usuario=id_usu)
        #usu_instancia = usuario_lista
        #usu = User.objects.all()
        usu = User.objects.get(id=id_usu)
        #usus = usuario.create(usu) 
        even = evento.objects.get(id=id_eve)
        #reques
        #return HttpResponse(usu)
        guardar_evento = usuarioEvento.objects.create(id_evento=even, id_usuario = usu )
        guardar_evento = usuarioEvento(id_evento=even, id_usuario=usu)
        #guardar_evento.save(force_insert=True)
        guardar_evento.save()
        return HttpResponse('respuesta')

def lista_noticia_dashboard_view(request):
        #Listado de bd + Paginación noticias        
        lista_noticia_dashboard = noticia.objects.all()
        noticia_lista = Paginator(lista_noticia_dashboard, 4) # Show 25 contacts per page
        page = request.GET.get('page')
        try:
                noticias_l = noticia_lista.page(page)
        except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                noticias_l = noticia_lista.page(1)
        except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                noticias_l = noticia_lista.page(paginator.num_pages)
        return render(request, 'lista-noticia-dashboard.html', {'noticias_l': noticias_l})       
        
def Logout(request):
    logout(request)
    return redirect(reverse_lazy('deportes:index'))
        
def lista_noticias_view(request):
        
        lista_noticias = noticia.objects.all().filter(estado=True)
        context = {'lista_noticias': lista_noticias}
        return render(request, 'lista-noticias.html', context)

        
def noticias_view(request,id_noticia):
        ver_noticia = noticia.objects.get(id=id_noticia)
        context = {'ver_noticia':ver_noticia}
        return render(request, 'noticia.html', context)
        
def formulario_view(request):
        return render(request, 'formulario.html', {})
        
def lista_eventos_view(request):
        lista_eventos = evento.objects.all()
        context = {'lista_eventos': lista_eventos}
        return render(request, 'lista-eventos.html', context)
        
def eventos_view(request, id_evento):
        ver_evento = evento.objects.get(id=id_evento)
        context = {'ver_evento':ver_evento}
        return render(request, 'evento.html', context)

'''        
def dashboard_view(request, id_dashboard):
        trabajador = usuario.objects.get(id=id_dashboard)
        lista_dashboard = evento.objects.all()
        lista_noticia_dashboard = noticia.objects.all()
        lista_usuarios_dashboard = usuario.objects.all()
        context = {'lista_dashboard': lista_dashboard, 'lista_noticia_dashboard':lista_noticia_dashboard, 'lista_usuarios_dashboard':lista_usuarios_dashboard, 'trabajador':trabajador}
        return render(request, 'dashboard.html', context)
'''     
        

def dashboard_view(request):
        lista_dashboard = evento.objects.all()
        lista_noticia_dashboard = noticia.objects.all()
        lista_usuarios_dashboard = usuario.objects.all()
        if request.method == "POST":
                valorBoton =  request.POST['cerrarsesion']
                if valorBoton == "cerrarsesion":
                        logout(request)
                        return HttpResponse('index.html')
        else:
                context = {'lista_dashboard': lista_dashboard, 'lista_noticia_dashboard':lista_noticia_dashboard, 'lista_usuarios_dashboard':lista_usuarios_dashboard}
                return render(request, 'dashboard.html', context)
  
        
        
def formulario_evento_view(request):
        return render(request, 'formulario-evento.html', {})
        
def formulario_actividad_view(request):
        return render(request, 'formulario-actividad.html', {})

#FORMULARIOS DERLY   
def formatoFecha(stringFecha):
        dia, mes, ano = stringFecha.split()
        if mes == 'January,':
                mesInt = 1;
        elif mes == 'February,':
                mesInt = 2;
        elif mes == 'March,':
                mesInt = 3;
        elif mes == 'April,':
                mesInt = 4;
        elif mes == 'May,':
                mesInt = 5;
        elif mes == 'June,':
                mesInt = 6;
        elif mes == 'July,':
                mesInt = 7;
        elif mes == 'August,':
                mesInt = 8;
        elif mes == 'September,':
                mesInt = 9;
        elif mes == 'October,':
                mesInt = 10;
        elif mes =='November,':
                mesInt = 11;
        else:
                mesInt = 12;
        fecha = ano + "-" + str(mesInt) + "-" + dia
        datetime.datetime.strptime(fecha, "%Y-%m-%d").date()
        return fecha
        
        
def formulario_noticia_view(request):
        if request.method == 'POST':
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                noticiaSave = noticiaForm(request.POST.copy(),  request.FILES)
                noticiaSave.data['fecha'] = nuevaFecha
                
                if noticiaSave.is_valid():
                        noti = noticiaSave.save()
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        return HttpResponseRedirect('formulario_noticia')
                        #return HttpResponse(noticiaSave)
                else:
                        
                        print(noticiaSave.errors )
                        return HttpResponse(noti.errors)
        else:
                noticia_F = noticiaForm() # instancia del formulario
                #return HttpResponse('pru')
                return render_to_response('formulario-noticia.html', {'noticiaForm': noticia_F}, context_instance=RequestContext(request))
                #return render(request, 'formulario-noticia.html', {})

#....

'''
def formulario_usuario_view(request):
        if request.method == 'POST': #metodo post para envio de formularios, creación de registros
                fecha = request.POST['fechaNacimiento']
                nuevaFecha = formatoFecha(fecha)
                usuarioSave = registroUsuarioForm(request.POST.copy(),  request.FILES)
                usuarioSave.data['fechaNacimiento'] = nuevaFecha
                if usuarioSave.is_valid():
                        usua = usuarioSave.save()
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        return HttpResponseRedirect('formulario_usuario')
                        #return HttpResponse('weldonr')
                else:#Error de validacion
                        
                        print(usuarioSave.errors )
                        return HttpResponse(usua.errors)
        else:#Petición de carga de página
                usuario_F = registroUsuarioForm() # instancia del formulario
                return render_to_response('formulario-usuario.html', {'registroUsuarioForm': usuario_F}, context_instance=RequestContext(request))
                #return HttpResponse('cargando formulario')
'''

def crear_cuenta_view(request):
        return render(request, 'crear-cuenta.html', {})