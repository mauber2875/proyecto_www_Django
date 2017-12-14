from django.conf.urls import url
from . import views 


urlpatterns = [
        url(r'^$', views.index_view, name='index'),
        url(r'^lista_noticias/', views.lista_noticias_view, name='lista_noticias'),
        url(r'^noticia/(?P<id_noticia>[0-9]+)/$', views.noticias_view, name='noticia'),
        url(r'^lista_eventos/', views.lista_eventos_view, name='lista_eventos'),
        url(r'^evento/(?P<id_evento>[0-9]+)/$', views.eventos_view, name='evento'),
        url(r'^dashboard/', views.dashboard_view, name='dashboard'),
        url(r'^formulario-usuario/', views.formulario_usuario_view, name='formulario-usuario'),
        url(r'^formulario_evento/', views.formulario_evento_view, name='formulario_evento'),
        url(r'^formulario_actividad/', views.formulario_actividad_view, name='formulario_actividad'),
        url(r'^formulario_noticia/', views.formulario_noticia_view, name='formulario_noticia'),
        url(r'^crear_cuenta/', views.crear_cuenta_view, name='crear_cuenta'),
        
        #DERLY-URLS
        url(r'^formulario/', views.formulario_view, name='formulario'),
        url(r'^logout/', views.Logout, name="logout"),
        #url(r'^guardar_evento_usuario/(?P<id_eve>[0-9]+)/(?P<id_usu>[0-9]+)/$', views.guardar_evento_usuario, name='guardar_evento_usuario'),
        url(r'^guardar_evento_usuario/(?P<id_eve>[0-9]+)/$', views.guardar_evento_usuario, name='guardar_evento_usuario'),
        url(r'^lista-noticia-dashboard/', views.lista_noticia_dashboard_view, name='lista-noticia-dashboard'),
        url(r'^formulario-noticia-update/(?P<id_noticia>[0-9]+)/$', views.formulario_noticia_update_view, name='formulario-noticia-update'),
        #DERLY-URLS2
        url(r'^lista-eventos-dashboard/', views.lista_eventos_dashboard_view, name='lista-eventos-dashboard'),
        url(r'^formulario-eventos-update/(?P<id_evento>[0-9]+)/$', views.formulario_eventos_update_view, name='formulario-eventos-update'),
        url(r'^lista-usuarios-dashboard/', views.lista_usuarios_dashboard_view, name='lista-usuarios-dashboard'),
        url(r'^formulario-usuario-update/(?P<id_usuario>[0-9]+)/$', views.formulario_usuario_update_view, name='formulario-usuario-update'),
        url(r'^lista-actividades-dashboard/', views.lista_actividades_dashboard_view, name='lista-actividades-dashboard'),
        url(r'^formulario-actividades-update/(?P<id_actividad>[0-9]+)/$', views.formulario_actividades_update_view, name='formulario-actividades-update'),
        url(r'^servicio/', views.servicio, name='servicio'),
        
        #SECCIÓN DE PAGO Y OTROS - ALEJANDRO, JESSICA
        url(r'^ver_listado_eventos_usuario/', views.ver_listado_eventos_usuario_view, name='ver_listado_eventos_usuario'),
        url(r'^pagar_evento/(?P<id_evento>[0-9]+)/$', views.PagarEvento, name='pagar_evento'),
        #url(r'^pagar_evento/(?P<pk>\w+)$', views.PagarEvento.as_view()),
        url(r'^inscripcion_actividades/(?P<id_evento_seleccionado>[0-9]+)/$', views.inscripcion_actividades, name='inscripcion_actividades'),
        url(r'^generar_escarapela/(?P<id_evento>[0-9]+)/$', views.generar_escarapela, name='escarapela'),
        url(r'^calendario_actividades/', views.calendario_actividades, name='calendario_actividades'),
        url(r'^dashboard_eventos/', views.dashboard_eventos, name='dashboard_eventos'),
    ]
    
    