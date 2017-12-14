from django.shortcuts import render
from django.shortcuts import render_to_response, HttpResponseRedirect, redirect
from django.contrib.auth import authenticate, login, logout
from django.core.urlresolvers import reverse_lazy
#from django.contrib.auth.models import User
#Vistas
from .models import noticia
from .models import evento
from .models import usuario
from .models import actividades

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render

#ModelFomrs
from .models import noticiaForm
from .models import eventoForm
from .models import registroUsuarioForm
from .models import registroUserForm
from .models import actividadesForm

#Otros
import datetime
import random
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import TemplateView, DetailView, CreateView
from django.conf import settings
from .forms import *
from django.core.files.storage import FileSystemStorage




#para servicio
import json
from urllib.request import urlopen

#Para subir archivos al servidor
# Create your views here.

def index_view(request):
        index_eventos = evento.objects.all()[:6]
        index_noticias = noticia.objects.all()[:5]
        mensaje = ""
        
        
        #----Personalizar Dashboard----
        temperatura = random.randint(19, 31)
        tiempo_actual = datetime.datetime.now()
        año = tiempo_actual.year
        mes = tiempo_actual.month
        dia = tiempo_actual.day
        hora = tiempo_actual.hour
        if hora >= 0 and hora < 5:
                hora = hora+12+7
        else:
                hora = hora - 5
                
        minuto = tiempo_actual.minute
        horario, imagen_clima = '', ''
        
        if hora >= 5 and hora < 12:
                horario = 'Mañana'
        elif hora >= 12 and hora < 18:
                horario = 'Tarde'
        else:
                horario = 'Noche'
        #-------------------------------
        
        
        #if request.user.is_authenticated():
                #return HttpResponseRedirect('/')
                #return HttpResponse('estoy autenticado')
         #       return render(request, 'dashboard.html', {})
        #else:
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
                                        return render(request, 'dashboard.html', 
                                                        {
                                                        'usu_rol': usu_rol, 
                                                        'temperatura':temperatura, 
                                                        'año':año,
                                                        'mes':mes,
                                                        'dia':dia,
                                                        'hora':hora,
                                                        'minuto':minuto,
                                                        'horario':horario,
                                                        'imagen_clima':imagen_clima
                                                        }
                                                     )
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


def servicio(request):
        
        response = urlopen("http://hmrsoftware.com/abceventos/servicio.php").read().decode('utf8')
        obj = json.loads(response)
        eventosUsuario = obj['data']
        for even in eventosUsuario:
                print(even['cedula'])
                usua = User.objects.get(id=even['cedula'])
                informacion_evento = evento.objects.get(id = even['id_evento'])
                obj = usuarioEvento.objects.get(id_usuario=usua, id_evento= informacion_evento)
                obj.pago = True
                obj.estado = 'Participante'
                obj.save()
        #return render(request, 'Pagos/ver_listado_eventos_usuario.html/')
        return redirect(reverse_lazy('deportes:dashboard'))
        
        



def dashboard_view(request):
        if request.user.is_authenticated():
                #----Personalizar Dashboard----
                temperatura = random.randint(19, 31)
                tiempo_actual = datetime.datetime.now()
                año = tiempo_actual.year
                mes = tiempo_actual.month
                dia = tiempo_actual.day
                hora = tiempo_actual.hour
                if hora >= 0 and hora < 5:
                        hora = hora+12+7
                else:
                        hora = hora - 5
                
                minuto = tiempo_actual.minute
                horario, imagen_clima = '', ''
        
                if hora >= 5 and hora < 12:
                        horario = 'Mañana'
                elif hora >= 12 and hora < 18:
                        horario = 'Tarde'
                else:
                        horario = 'Noche'
        #-------------------------------
        
                lista_dashboard = evento.objects.all()
                lista_noticia_dashboard = noticia.objects.all()
                lista_usuarios_dashboard = usuario.objects.all()
                current_user = request.user
                usua = User.objects.get(id=current_user.id)
                #evento_usu = usuarioEvento.objects.filter(id_usuario=usua)
                #usu_ide = user.id
                #usu = User.objects.get(id=usu_ide)
                usu_rol = usuario.objects.get(user_id=usua)
                
                context = {
                          'lista_dashboard': lista_dashboard, 
                          'lista_noticia_dashboard':lista_noticia_dashboard, 
                          'lista_usuarios_dashboard':lista_usuarios_dashboard,
                          'usu_rol':usu_rol,
                          'temperatura':temperatura, 
                          'año':año,
                          'mes':mes,
                          'dia':dia,
                          'hora':hora,
                          'minuto':minuto,
                          'horario':horario,
                          'imagen_clima':imagen_clima
                }
                if request.method == "POST":
                        valorBoton =  request.POST['cerrarsesion']
                        if valorBoton == "cerrarsesion":
                                logout(request)
                                return HttpResponse('index.html')
        #else:
                
                return render(request, 'dashboard.html', context)
        else:
                return redirect(reverse_lazy('deportes:index'))
                #return HttpResponseRedirect('index.html')





def lista_eventos_dashboard_view(request):
        #Listado de bd + Paginación eventos        
        lista_evento_dashboard = evento.objects.all()
        evento_lista = Paginator(lista_evento_dashboard, 6) # Show 25 contacts per page
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
        #SELECT Request.item_owner,Request.message_body FROM Request INNER JOIN Item ON Request.item_id=Item.id AND Item.item_is_locked=False;
        #Request.objects.filter(item__item_is_locked=False).only('item_owner', 'message_body')
        
        usuario_lista = Paginator(lista_usuario_dashboard, 10) # Show 25 contacts per page
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

def lista_actividades_dashboard_view(request):
        #Listado de bd + Paginación usuarios        
        lista_actividades_dashboard = actividades.objects.all()
        #SELECT Request.item_owner,Request.message_body FROM Request INNER JOIN Item ON Request.item_id=Item.id AND Item.item_is_locked=False;
        #Request.objects.filter(item__item_is_locked=False).only('item_owner', 'message_body')
        actividad_lista = Paginator(lista_actividades_dashboard, 10) # Show 25 contacts per page
        page = request.GET.get('page')
        try:
                actividades_l = actividad_lista.page(page)
        except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                actividades_l = actividad_lista.page(1)
        except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                actividades_l = actividad_lista.page(paginator.num_pages)
        return render(request, 'lista-actividades-dashboard.html', {'actividades_l': actividades_l})   



def  formulario_noticia_update_view(request, id_noticia):
         
      #---------------------------------------------
         if request.method == 'POST':
                #if null? request.POST['estado']:
                estado = request.POST.get('estado', False)
                imagen  = request.POST.get('imagen', False)
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                id_noti = request.POST['noti_id']
                obj = noticia.objects.get(id=id_noti)
                obj.titulo = request.POST['titulo']
                obj.copete = request.POST['copete']
                obj.cuerpo = request.POST['cuerpo']
                obj.autor = request.POST['autor']
                if imagen is not False:
                        fs = FileSystemStorage()
                        filename = fs.save(imagen.name, imagen)
                        uploaded_file_url = fs.url(filename)
                        obj.imagen = imagen.name
                obj.fecha = nuevaFecha
                        #obj.imagen = request.POST['imagen']
                obj.estado = estado
                obj.save()
                return HttpResponseRedirect(request.get_full_path())
         else:
                ver_noticia = noticia.objects.get(id=id_noticia)
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                fecha =  fechaFormulario(ver_noticia.fecha)
                usu_rol = usuario.objects.get(user_id = usuActualId)
                return render(request, 'formulario-noticia-update.html', {'ver_noticia':ver_noticia, 'usu_rol':usu_rol, 'fecha':fecha})
                #return redirect(reverse_lazy('deportes:formulario-noticia-update.html'))

def  formulario_eventos_update_view(request, id_evento):
      #---------------------------------------------
         if request.method == 'POST':
                estado = request.POST.get('estado', False)
                imagen  = request.FILES.get('imagen', False)

                fecha = request.POST['fechaInicio']
                hora_p = request.POST['hora']
                nuevaFecha = formatoFecha(fecha)
                horas = formatoHora(hora_p)
                obj = evento.objects.get(id=id_evento)
                obj.titulo = request.POST['titulo']
                obj.ciudad = request.POST['ciudad']
                obj.tipo_deporte = request.POST['tipo_deporte']
                obj.descripcion = request.POST['descripcion']
                obj.lugar = request.POST['lugar']
                obj.costo = request.POST['costo']
                obj.participante = request.POST['participante']
                obj.fechaInicio = nuevaFecha
                obj.hora = horas
                obj.encargado = request.POST['encargado']
                obj.restriccion = request.POST['restriccion']
                obj.estado = estado
                if imagen is not False:
                        fs = FileSystemStorage()
                        filename = fs.save(imagen.name, imagen)
                        uploaded_file_url = fs.url(filename)
                        obj.imagen = imagen.name
                obj.save()
                return HttpResponseRedirect(request.get_full_path())
                
         else:  
                ver_evento = evento.objects.get(id=id_evento)
                usuActual = request.user
                usuActualId = usuActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                fecha =  fechaFormulario(ver_evento.fechaInicio)
                hora = formatoHoraForm(ver_evento.hora);
                return render(request, 'formulario-eventos-update.html', {'ver_evento':ver_evento, 'usu_rol':usu_rol, 'fecha':fecha, 'hora':hora})
                #return redirect(reverse_lazy('deportes:formulario-evento-update.html'))



        
def  formulario_usuario_update_view(request, id_usuario):
      #---------------------------------------------
         if request.method == 'POST':
                ##Informacion con manejo especial
                estado = request.POST.get('estado', False)
                imagen  = request.FILES.get('foto', False)
                fecha = request.POST['fechaNacimiento']
                nuevaFecha = formatoFecha(fecha)
                obj_usuario = usuario.objects.get(id=id_usuario)
                obj_user = User.objects.get(id=obj_usuario.user.id)
                
                #User modificación
                obj_user.first_name= request.POST['first_name']
                obj_user.last_name= request.POST['last_name']
                obj_user.username=request.POST['username']
                obj_user.password=request.POST['password']
                obj_user.email=request.POST['email']
                obj_user.is_active  = estado
                obj_user.save()
                        
                #Usuario modificación
                #foto - fechaNacimiento- genero - rol
                obj_usuario.fechaNacimiento = nuevaFecha
                obj_usuario.genero = request.POST['genero']
                obj_usuario.rol = request.POST['rol']
                if imagen is not False:
                        fs = FileSystemStorage()
                        filename = fs.save(imagen.name, imagen)
                        uploaded_file_url = fs.url(filename)
                        obj_usuario.foto = imagen.name
                obj_usuario.save()
                ##/////////////////////////////////////////////////////
                return HttpResponseRedirect(request.get_full_path())
                #return HttpResponse(noti.errors)
         else:
                ver_usuario = usuario.objects.get(id=id_usuario)
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                fechaN =  fechaFormulario(ver_usuario.fechaNacimiento)
                return render(request, 'formulario-usuario-update.html', {'ver_usuario':ver_usuario, 'usu_rol':usu_rol, 'fechaN':fechaN})
                #return redirect(reverse_lazy('deportes:formulario-usuario-update.html'))
        
        


def  formulario_actividades_update_view(request, id_actividad):
      #---------------------------------------------
         if request.method == 'POST':
                estado = request.POST.get('estado', False)
                
                fecha = request.POST['fechaInicio']
                hora_pi = request.POST['horaInicio']
                hora_pf = request.POST['horaFinal']
                nuevaFecha = formatoFecha(fecha)
                horasi = formatoHora(hora_pi)
                horasf = formatoHora(hora_pf)
                even = evento.objects.get(id= request.POST['id_evento'])
                obj = actividades.objects.get(id=id_actividad)
                
                obj.nombre = request.POST['nombre']
                obj.id_evento = even
                obj.fechaInicio=nuevaFecha
                obj.horaInicio=horasi
                obj.horaFinal=horasf
                obj.estado=estado
                obj.save()
                return HttpResponseRedirect(request.get_full_path())
         else:  
                ver_actividad = actividades.objects.get(id=id_actividad)
                usuActual = request.user
                usuActualId = usuActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                fecha =  fechaFormulario(ver_actividad.fechaInicio)
                horai = formatoHoraForm(ver_actividad.horaInicio);
                horaf = formatoHoraForm(ver_actividad.horaFinal);
                return render(request, 'formulario-actividades-update.html', {'ver_actividad':ver_actividad, 'usu_rol':usu_rol, 'fecha':fecha, 'horai':horai, 'horaf':horaf})
                

#def guardar_evento_usuario(request, id_eve, id_usu):
#        print (id_eve)
#        print (id_usu)

#-----------PAGOS-----------------

def guardar_evento_usuario(request, id_eve):
        current_user = request.user
        usua = User.objects.get(id=current_user.id)
        informacion_evento = evento.objects.get(id = id_eve)
        cupo = informacion_evento.participante #Cantidad de participantes máxima que permite el evento
        inscritos_evento = usuarioEvento.objects.filter(id_evento=id_eve).count()
        print(inscritos_evento)
        if cupo > inscritos_evento:
                guardar_evento = usuarioEvento.objects.create(id_evento=informacion_evento, id_usuario = usua, estado = "Inscrito")
        else:
               guardar_evento = usuarioEvento.objects.create(id_evento=informacion_evento, id_usuario = usua, estado = "Pre-inscrito") 
        #guardar_evento = usuarioEvento.objects.create(id_evento=informacion_evento, id_usuario = usua)
        guardar_evento.save()
        return redirect(reverse_lazy('deportes:ver_listado_eventos_usuario'))


def ver_listado_eventos_usuario_view(request):
        current_user = request.user
        usua = User.objects.get(id=current_user.id)
        evento_usu = usuarioEvento.objects.filter(id_usuario=usua)
        #------------------
        usu_rol = usuario.objects.get(user_id=current_user.id)
        context = {
                'evento_usu':evento_usu,
                'usuario':usu_rol
        }
        return render(request, 'Pagos/ver_listado_eventos_usuario.html', context)
     

def PagarEvento(request, id_evento):
        current_user = request.user
        informacion_evento = evento.objects.get(id = id_evento)
        return render(request, 'Pagos/pagar_evento.html', {'current_user':current_user, 'informacion_evento':informacion_evento})
	
		
def generar_escarapela(request, id_evento):
        evento_seleccionado = evento.objects.get(id=id_evento)
        current_user = request.user
        #usua = User.objects.get(id=current_user.id)
        usu_rol = usuario.objects.get(user_id=current_user.id)
        context = {
                'evento_seleccionado':evento_seleccionado,
                'usuario': usu_rol
        }
        return render(request, 'Pagos/escarapela.html', context)
        
        
def inscripcion_actividades(request, id_evento_seleccionado):
        current_user = request.user
        usua = User.objects.get(id=current_user.id)
        usu_rol = usuario.objects.get(user_id=current_user.id)
        lista_actividades = actividades.objects.filter(id_evento = id_evento_seleccionado)
        evento_seleccionado = evento.objects.get(id = id_evento_seleccionado)
        evento_usu = usuarioEvento.objects.get(id_usuario=usua.id, id_evento=id_evento_seleccionado)
        evento_usu.pago = True
        evento_usu.save()
        context = {
                'evento_seleccionado': evento_seleccionado,
                'usuario': usu_rol,
                'lista_actividades': lista_actividades
        }
        return render(request, 'Pagos/inscripcion_actividades.html', context)
        

def calendario_actividades(request):
        current_user = request.user
        usu_rol = usuario.objects.get(user_id=current_user.id)
        context = {
                'usuario': usu_rol
        }
        return render(request, 'calendario_actividades.html', context)



def dashboard_eventos(request):
        current_user = request.user
        usu_rol = usuario.objects.get(user_id=current_user.id)
        #Gestion Usuarios
        total_usuarios = usuario.objects.all().count
        total_mujeres = usuario.objects.filter(genero = 'Femenino').count()
        total_hombres = usuario.objects.filter(genero = 'Masculino').count()
        
        context = {
                'usuario': usu_rol,
                'total_usuarios': total_usuarios,
                'total_mujeres': total_mujeres,
                'total_hombres': total_hombres,
        }
        return render(request, 'dashboard_eventos.html', context)


#--------------------------------------------------
def lista_noticia_dashboard_view(request):
        #Listado de bd + Paginación noticias        
        lista_noticia_dashboard = noticia.objects.all()
        noticia_lista = Paginator(lista_noticia_dashboard, 6) # Show 25 contacts per page
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

        
        
def formulario_evento_view(request):
        
        if request.method == 'POST':        
                fecha = request.POST['fechaInicio']
                hora_p = request.POST['hora']
                nuevaFecha = formatoFecha(fecha)
                horas = formatoHora(hora_p)
                evenSave = eventoForm(request.POST.copy(),  request.FILES)
                evenSave.data['fechaInicio'] = nuevaFecha
                evenSave.data['hora'] =horas.time()
                
                if evenSave.is_valid():
                        even = evenSave.save()
                        evenId = even.id;
                        
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        #return HttpResponse(notiId);
                        return HttpResponseRedirect('../formulario-eventos-update/'+ str(evenId))
                else: 
                        print(evenSave.errors )
                        return HttpResponse(evenSave.errors)
        else:
                evento_F = eventoForm() # instancia del formulario
                #return HttpResponse('pru')
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                return render_to_response('formulario-evento.html', {'evento_F': evento_F, 'usu_rol':usu_rol}, context_instance=RequestContext(request))
                #return render(request, 'formulario-noticia.html', {})
        #return render(request, 'formulario-evento.html', {})
        
def formulario_actividad_view(request):
        if request.method == 'POST':
                fecha = request.POST['fechaInicio']
                hora_i = request.POST['horaInicio']
                hora_f = request.POST['horaFinal']
                nuevaFecha = formatoFecha(fecha)   
                horas_i = formatoHora(hora_i)
                horas_f = formatoHora(hora_f)
                actividadSave = actividadesForm(request.POST.copy())
                actividadSave.data['fechaInicio'] = nuevaFecha
                actividadSave.data['horaInicio'] = horas_i.time()
                actividadSave.data['horaFinal'] = horas_f.time()
                if actividadSave.is_valid():
                        activi = actividadSave.save()
                        activiId = activi.id;
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        #return HttpResponse(notiId);
                        return HttpResponseRedirect('../formulario-actividades-update/'+ str(activiId))
                
                else:
                        print(actividadSave.errors )
                        return HttpResponse(actividadSave.errors)
                
                return HttpResponse('pru')
        
        else:
                actividades_F = actividadesForm() # instancia del formulario
                #return HttpResponse('pru')
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                return render_to_response('formulario-actividad.html', {'evento_F': actividades_F, 'usu_rol':usu_rol}, context_instance=RequestContext(request))
        #return render(request, 'formulario-actividad.html', {})

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
        
def formatoHora(stringHora):
        H  =  datetime.datetime.strptime(stringHora, '%I:%M%p')
        return H

def formatoHoraForm(hora):
        horaString  =  hora.strftime('%I:%M%p')
        return horaString

        
def formulario_noticia_view(request):
        if request.method == 'POST':
                fecha = request.POST['fecha']
                nuevaFecha = formatoFecha(fecha)
                noticiaSave = noticiaForm(request.POST.copy(),  request.FILES)
                noticiaSave.data['fecha'] = nuevaFecha
                
                if noticiaSave.is_valid():
                        noti = noticiaSave.save()
                        notiId = noti.id;
                        
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        #return HttpResponse(notiId);
                        return HttpResponseRedirect('../formulario-noticia-update/'+ str(notiId))
                        #return HttpResponse(noticiaSave)
                else:
                        
                        print(noticiaSave.errors )
                        return HttpResponse(noti.errors)
        else:
                noticia_F = noticiaForm() # instancia del formulario
                usuarioActual = request.user
                usuActualId = usuarioActual.id
                usu_rol = usuario.objects.get(user_id = usuActualId)
                #fecha =  fechaFormulario(ver_no.fechaInicio)
                #hora = formatoHoraForm(ver_evento.hora);
                #return HttpResponse('pru')
                return render_to_response('formulario-noticia.html', {'noticiaForm': noticia_F,'usu_rol':usu_rol}, context_instance=RequestContext(request))
                #return render(request, 'formulario-noticia.html', {})


def fechaFormulario(fecha):
        fechastring = fecha.strftime('%Y-%B-%d')
        ano, mes,  dia = fechastring.split('-') 
        fechaModificada = dia + ' ' + mes + ', ' + ano
        return fechaModificada
        

#....

def formulario_usuario_view(request):
        usuarioActual = request.user
        usuActualId = usuarioActual.id
        usu_rol = usuario.objects.get(user_id = usuActualId)
        if request.method == 'POST': #metodo post para envio de formularios, creación de registros
                #Primero creando el registro de User
                first_n = request.POST['first_name']
                last_n = request.POST['last_name']
                usern= request.POST['username']
                passw = request.POST['password']
                mail =request.POST['email']
                #User.objects.create_superuser(username='yourUsername', password='YourPassword', email='your@email.PK')
                usua = User.objects.create_superuser(email=mail, first_name=first_n,last_name=last_n, username=usern, password=passw)
                usua.save()
                #Validando userSave
                #['first_name', 'last_name', 'username', 'password', 'email'] 
                fecha = request.POST['fechaNacimiento']
                nuevaFecha = formatoFecha(fecha)
                userId = usua.id
                usuarioSave = registroUsuarioForm(request.POST.copy(),  request.FILES)
                usuarioSave.data['fechaNacimiento'] = nuevaFecha
                usuarioSave.data['user'] = userId
                
                if usuarioSave.is_valid():
                        usuari = usuarioSave.save()
                        usuId = usuari.id;
                        
                        # commit=False tells Django that "Don't send this to database yet.
                        # I have more things I want to do with it."
                        #return HttpResponse(notiId);
                        return HttpResponseRedirect('../formulario-usuario-update/'+ str(usuId))
                else:#Error de validacion
                        
                        print(usuarioSave.errors )
                        return HttpResponse(usuarioSave.errors)
        else:#Petición de carga de página
                usuario_F = registroUsuarioForm() # instancia del formulario
                return render_to_response('formulario-usuario.html', {'registroUsuarioForm': usuario_F,  'usu_rol':usu_rol}, context_instance=RequestContext(request))
                #return HttpResponse('cargando formulario')


def crear_cuenta_view(request):
        return render(request, 'crear-cuenta.html', {})