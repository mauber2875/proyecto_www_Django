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