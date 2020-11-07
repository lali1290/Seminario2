extends Node2D


func _ready():
	$Node2D2/TileMap/Baiting.hide()
	$Node2D2/TileMap/Pretexting.hide()
	$Node2D2/TileMap/Phishing.hide()
	$Node2D2/TileMap/ShoulderSurfing.hide()
	$Node2D2/TileMap/Vishing.hide()
	$"Node2D2/TileMap/DumpsterDiving ".hide()
	$"Node2D2/TileMap/B-No".show()
	$"Node2D2/TileMap/B-Si".show()
	$"Node2D2/TileMap/B-No".text=textoNo[contador]
	$"Node2D2/TileMap/B-Si".text=textoSo[contador]
	preguntas(0,lista)

var rng = RandomNumberGenerator.new()
var contador=rng.randf_range(0,1)
var puntaje=0
var resp=true
var lista=[
"En un día cualquiera, Pablo recibe una llamada desconocida, le dicen que ganó un concurso para un viaje todo pagado. Requieren sus datos para poder entregarle el premio. \n¿Crees que le entrega tus datos?",
"Más tarde, Pablito recibe una llamada de un banco pidiéndole sus datos personales para que actualicen su información. \n¿Debería dar su información?",
"En la noche, Pablito recibe una llamada diciendo que se ha ganado una importante cantidad de dinero en un sorteo de lotería extranjera. Necesitan que ahora mismo su dirección para que le manden el premio directo a su casa. Tiene solo 10 segundos para dar su dirección o pierde el premio. \n¿Qué crees que elige?",
"Una semana después, Pablito recibe una llamada del “Área de mantenimiento”, dicen que hay una nueva política de seguridad en la empresa y piden que le brinden su número de trabajador para poder actualizarlo en el sistema, pero no le informaron de la actualización del servicio. \n¿Qué hace?",
"Esa misma noche, Pablito está trabajando y le llega un correo de un supuesto compañero que dice: 'Hola, estoy teniendo una mañana ocupada, estoy preparando una sorpresa para los jefes de área, ¿Me podrías dar el email de tu jefe?' \n¿Qué debería hacer?",
"Le llego un correo que dice: 'Hola, por favor renueva tu número de cuenta para Haberes enviando el número de cuenta por este correo'. \n¿Debería responde el correo o prefiere preguntar a su jefe si están actualizando los datos de sus cuentas bancarias?"]

var respuesta=[false,false,false, true,true,true]
var textoNo= ["No entrega","No debe","No le interesa", "Si entrega","Si le da","Responde"]
var textoSo= ["Si entrega","Sí ddebe","Da su dirección", "No entrega","No le da","Pregunta"]

var respNo=["¡¡Felicidades!! \nRecuerda que los estafadores suelen ofrecer paquetes de viaje fraudulentos",
"¡¡MUY BIEN!! \nRecuerda el banco nunca te va a pedir tus datos personales por llamadas, siempre será por su página web",
"¡¡Felicidades!! \nSiempre debes de resistir a la presión de tomar una decisión inmediatamente, los estafadores utilizan esa técnica para engañar",
"¡¡CUIDADO!! ¡¡¡Pablito fue víctima de PRETEXTING!!!! \nSi tienes duda consulta directamente con el jefe de tu área o del área que solicita la información si están haciendo algunas actualizaciones de políticas en la empresa.",
"¡¡¡FELICIDADES!!! ¡¡¡Ayudaste a que Pablito evitara el PRETEXTING!!! \nUsualmente el hacker va a buscar información de algún superior para poder obtener información confidencial de la empresa.",
"¡¡Oh no!! Pablito fue víctima de PRETEXTING!!!! \nRecuerda que las empresas siempre avisan sobre la actualización de datos"]

var respSi=["¡¡¡Estafaron a Pablito!!!! \nRecuerda que los estafadores suelen ofrecer paquetes de viaje fraudulentos",
"¡¡Oh no!! \nRecuerda el banco nunca te va a pedir tus datos personales por llamadas, siempre será por su página web",
"¡¡¡OH NOOO!!! ¡¡ESTAFARON a Pablito!! \nSiempre debes de resistir a la presión de tomar una decisión inmediatamente, los estafadores utilizan esa técnica para engañar",
"¡¡¡MUY BIEN!!! ¡¡¡Ayudaste a que Pablito evitara el PRETEXTING!!! \nSi tienes duda consulta directamente con el jefe de tu área o del área que solicita la información si están haciendo algunas actualizaciones de políticas en la empresa.",
"¡¡¡Cuidado!!! Pablito puede ser víctima de PRETEXTING. \nUsualmente el hacker va a buscar información de algún superior para poder obtener información confidencial de la empresa.",
"¡¡EXCELENTE!! ¡¡¡Ayudaste a que Pablito evitara el PRETEXTING!!! \nRecuerda que las empresas siempre avisan sobre la actualización de datos"]

var concepto="El pretexting o pretexto es el acto de crear un falso escenario apelando a la confianza humana para que no solo revele información, sino también para que logre hacer alguna acción."

func preguntas(con,list):
	if (con<5):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]

func correctas(coso):
	if (coso == respuesta[contador]):
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(0, 0, 71, 1))
		puntaje = puntaje + 1
		#$Node2D2.puntaje_total= $Node2D2.puntaje_total+1
	else:
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(255, 0, 0, 1))

func _on_Node2D2_botonN():
	correctas(false)
	$"Node2D2/TileMap/B-No".hide()
	$"Node2D2/TileMap/B-Si".hide()
	$Node2D2/TileMap/Advertencia.text= respNo[contador]
	contador= contador + 1
	preguntas(contador,lista)
	print("contador" + str(contador))
	print("Tu puntaje es: "+str(puntaje))
	$Node2D2/TileMap/Label.hide()
	$Node2D2/TileMap/Continuar.show()
	$Node2D2/TileMap/Advertencia.show()

func _on_Node2D2_botonS():
	correctas(true)
	$"Node2D2/TileMap/B-No".hide()
	$"Node2D2/TileMap/B-Si".hide()
	$Node2D2/TileMap/Advertencia.text= respSi[contador]
	contador= contador + 1
	preguntas(contador,lista)
	print("Tu puntaje es: "+str(puntaje))
	$Node2D2/TileMap/Label.hide()
	$Node2D2/TileMap/Continuar.show()
	$Node2D2/TileMap/Advertencia.show()


func _on_Node2D2_Continuar():
	if (contador<5):
		$Node2D2/TileMap/Advertencia.hide()
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".show()
		$"Node2D2/TileMap/B-Si".show()
		$Node2D2/TileMap/Continuar.hide()
	elif(contador==5):
		$Node2D2/TileMap/Advertencia.text=concepto
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(0,0,0, 1))
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Pretexting")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
