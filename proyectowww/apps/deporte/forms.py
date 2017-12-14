from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm,UserChangeForm,PasswordChangeForm
from .models import *

class LoginForm(forms.Form):
	username = forms.CharField(max_length = 50,
	widget=forms.TextInput(attrs ={
		'id':"icon_prefix",
		'type':"text",
		'class':"validate",
		'required':"required",
		#'name':"username"
	}))
	
	password = forms.CharField(max_length = 50,
            widget = forms.TextInput(attrs = {
            	'id':"icon_telephone",
            	'type':"password",
            	'class':"validate",
            	'required':"required",
            	#'name':"password"
            	}))