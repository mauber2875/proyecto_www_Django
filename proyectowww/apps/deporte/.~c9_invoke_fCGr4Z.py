from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index_view, name='index'),
    url(r'^noti$', views.lista_noticias_view, name='index'),
    url(r'^noticia/', views.noticias_view, name='noticia'),
    url(r'^lista_eventos/', views.lista_eventos_view, name='lista_eventos'),
    url(r'^noticia/', views.noticias_view, name='noticia'),
    url(r'^formulario/', views.formulario_view, name='formulario'),
    
    #DERLY-URLS
    
    
]