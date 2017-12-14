function actualizarMenu(rol)
{
	if(rol == 'Administrador')
	{
		$('#btn-mi-info, #dropdown-noticias, #btn-crear-evento, #btn-crear-actividad').hide();
		$('#btn-iniciar-sesion, #btn-pag-principal').hide();
		$('#btn-inicio').addClass('teal darken-1');
		$('#dropdown-usuarios').addClass('teal');
		$('#dropdown-eventos').addClass('teal lighten-1');
		$('#dropdown-actividades').addClass('teal lighten-2');
		$('#btn-cerrar-sesion').addClass('teal lighten-3');
		$('#slide-out').addClass('teal lighten-4');
		$('#btn-crear-usuario, #btn-listar-usuarios, #btn-listar-eventos, #btn-listar-actividades, #btn-calendario-actividades').css('background-color','#8EC4B8');
		$('#btn-listar-eventos, #btn-dashboard-eventos').css('background-color','#8EC4B8');
	}


	if(rol == 'Gerente')
	{
		$("#rol-usuario").html('Gerente');

		$('#dropdown-noticias, #btn-crear-usuario, #btn-crear-evento, #btn-crear-actividad').hide();
		$('#btn-iniciar-sesion, #btn-pag-principal').hide();
		$('#btn-inicio').addClass('teal darken-1');
		$('#btn-mi-info').addClass('teal');
		$('#dropdown-usuarios').addClass('teal lighten-1');
		$('#dropdown-eventos').addClass('teal lighten-2');
		$('#dropdown-actividades').addClass('teal lighten-3');
		$('#btn-cerrar-sesion').addClass('teal lighten-4');
		$('#slide-out').addClass('teal lighten-5');
		$('#btn-listar-usuarios, #btn-listar-actividades, #btn-calendario-actividades').css('background-color','#8EC4B8');
		$('#btn-listar-eventos, #btn-dashboard-eventos').css('background-color','#8EC4B8');
	}


	if(rol == 'Operador')
	{
		$("#rol-usuario").html('Operador');

		$('#btn-crear-usuario').hide();		
		$('#btn-iniciar-sesion, #btn-pag-principal').hide();
		$('#encabezado-barra, .nav-wrapper').addClass('darken-3');
		$('#btn-inicio').addClass('teal darken-2');
		$('#btn-mi-info').addClass('teal darken-1');
		$('#dropdown-usuarios').addClass('teal');
		$('#dropdown-eventos').addClass('teal lighten-1');
		$('#dropdown-actividades').addClass('teal lighten-2');
		$('#dropdown-noticias').addClass('teal lighten-3');
		$('#btn-cerrar-sesion').addClass('teal lighten-4');
		$('#slide-out').addClass('teal lighten-5');
		$('#btn-listar-usuarios, #btn-listar-actividades, #btn-calendario-actividades').css('background-color','#8EC4B8');
		$('#btn-crear-evento, #btn-listar-eventos, #btn-dashboard-eventos').css('background-color','#8EC4B8');
		$('#btn-crear-actividad, #btn-crear-noticia, #btn-listar-noticias').css('background-color','#8EC4B8');
	}


	if(rol == 'Participante')
	{
		$("#rol-usuario").html('Participante');

		$('#dropdown-usuarios, #btn-crear-evento, #btn-crear-actividad, #dropdown-noticias').hide();
		$('#btn-iniciar-sesion, #btn-pag-principal').hide();
		$('#btn-inicio').addClass('teal darken-1');
		$('#btn-mi-info').addClass('teal');
		$('#dropdown-eventos').addClass('teal lighten-1');
		$('#dropdown-actividades').addClass('teal lighten-2');
		$('#btn-cerrar-sesion').addClass('teal lighten-3');
		$('#slide-out').addClass('teal lighten-4');
		$('#btn-listar-eventos, #btn-dashboard-eventos').css('background-color','#8EC4B8');
		$('#btn-listar-actividades, #btn-calendario-actividades').css('background-color','#8EC4B8');
		
	}


	if(rol == 'Usuario Público')
	{
		$("#nombre-usuario").html('Usuario Público');
		$("#rol-usuario").hide();

		$('#btn-iniciar-sesion, #btn-pag-principal, #dropdown-eventos').show();
		$('#btn-inicio, #btn-mi-info, #dropdown-usuarios, #btn-crear-evento, #btn-listar-eventos').hide();
		$('#dropdown-actividades, #dropdown-noticias, #btn-cerrar-sesion').hide();

		$('#btn-iniciar-sesion').addClass('teal');
		$('#dropdown-eventos').addClass('teal lighten-1');
		$('#btn-pag-principal').addClass('teal lighten-2');
		$('#slide-out').addClass('teal lighten-3');
		$('#btn-dashboard-eventos').css('background-color','#8EC4B8');
	}
}


//-----------Validar formularios----------------

function validarFormularioUsuarios()
{
	var nombres = document.forms["formularioCrearUsuario"]["field-nombres"].value;
	var apellidos = document.forms["formularioCrearUsuario"]["field-apellidos"].value;
	var nickname = document.forms["formularioCrearUsuario"]["field-nickname"].value;
	var pw = document.forms["formularioCrearUsuario"]["field-password"].value;
	var genero = document.forms["formularioCrearUsuario"]["select-genero"].value;

	if(pw == nickname) {
        alert("Error: La contraseña debe ser diferente al nombre de usuario!");
        document.forms["formularioCrearUsuario"]["field-password"].focus();
        return false;
      }
    re = /[0-9]/;
    if(re.test(nombres)) {
      alert("Error: El campo Nombres no puede contener números!");
      document.forms["formularioCrearUsuario"]["field-nombres"].focus();
      return false;
    }

    if(re.test(apellidos)) {
      alert("Error: El campo Apellidos no puede contener números!");
      document.forms["formularioCrearUsuario"]["field-apellidos"].focus();
      return false;
    }

    if(!re.test(pw)) {
      alert("Error: La contraseña debe contener al menos un número (0-9)!");
      document.forms["formularioCrearUsuario"]["field-password"].focus();
      return false;
    }
    re = /[a-z]/;
    if(!re.test(pw)) {
      alert("Error: La contraseña debe contener al menos una letra minúscula (a-z)!");
      document.forms["formularioCrearUsuario"]["field-password"].focus();
      return false;
    }
    re = /[A-Z]/;
    if(!re.test(pw)) {
      alert("Error: La contraseña debe contener al menos una letra mayúscula (A-Z)!");
      document.forms["formularioCrearUsuario"]["field-password"].focus();
      return false;
    }
    
}


//-----------Limpiar formularios----------------

function limpiarFormularioUsuarios()
{
	$('#field-foto').replaceWith('<div id="field-foto" class="file-field input-field"><div class="btn waves-effect waves-light hvr-wobble-skew"><span>Foto</span><i class="material-icons">camera_alt</i><input type="file"></div><div class="file-path-wrapper"><input class="file-path validate" type="text" placeholder="Selecciona una foto de perfil"></div></div>');
	
}


//-----------Eventos de las opciones del menú----------------

$("#btn-inicio").click(function()
{
    $("#inicio").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #calendario-actividades, #crear-noticia, #listar-noticias").hide();
});

$("#btn-mi-info").click(function()
{
	$("#mi-info").show();
	$("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #dashboard-eventos, #inicio").hide();
    $("#crear-actividad, #listar-actividades, ##calendario-actividades, #crear-noticia, #listar-noticias").hide();
});


$("#btn-listar-usuarios").click(function()
{
    $("#listar-usuarios").show();
    $("#crear-usuario, #inicio, #crear-evento, #listar-eventos, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #calendario-actividades, #crear-noticia, #listar-noticias").hide();
});


$("#btn-listar-eventos").click(function()
{
    $("#listar-eventos").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #inicio, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #calendario-actividades, #crear-noticia, #listar-noticias").hide();
});

$("#btn-dashboard-eventos").click(function()
{
    $("#dashboard-eventos").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #inicio, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #calendario-actividades, #crear-noticia, #listar-noticias").hide();
});


$("#btn-listar-actividades").click(function()
{
    $("#listar-actividades").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #inicio, #calendario-actividades, #crear-noticia, #listar-noticias").hide();
});

$("#btn-calendario-actividades").click(function()
{
    $("#calendario-actividades").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #inicio, #crear-noticia, #listar-noticias").hide();
});


$("#btn-listar-noticias").click(function()
{
    $("#listar-noticias").show();
    $("#crear-usuario, #listar-usuarios, #crear-evento, #listar-eventos, #dashboard-eventos, #mi-info").hide();
    $("#crear-actividad, #listar-actividades, #calendario-actividades, #crear-noticia, #inicio").hide();
});
