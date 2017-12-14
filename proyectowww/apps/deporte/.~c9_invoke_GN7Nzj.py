from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index_view, name='index'),
    url(r'^lista_noticias/', views.lista_noticias_view, name='lista_noticias'),
    url(r'^noticia/', views.noticias_view, name='noticia'),
    url(r'^lista_eventos/', views.lista_eventos_view, name='lista_eventos'),

    url(r'^formulario/', views.formulario_view, name='formulario'),
    
    #DERLY-URLS
    
    
]