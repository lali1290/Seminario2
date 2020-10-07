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

var contador=0
var puntaje=0
var resp=true
var lista=["Recibes una llamada desconocida, te dicen que ganaste un concurso para un viaje todo pagado. Te piden tus datos para poder entregarte el premio, ¿Les entregas tus datos?",
"Recibes una llamada de un banco pidiéndote tus datos personales para que actualicen tu información, ¿Das tu información?",
"Recibes una llamada diciendo que usted se ha ganado una importante cantidad de dinero en un sorteo de lotería extranjera. Necesitan que ahora mismo des tu dirección para que te manden el premio directo a tu casa. Tienes 10 segundos para dar tu dirección o pierdes el premio. ¿Qué eliges?",
"Recibes una llamada del “Área de mantenimiento”, te dicen que hay una nueva política de seguridad en la empresa y piden que les brindes tu número de trabajador para poder actualizarlo en el sistema, no te informaron de la actualización del servicio. ¿Qué haces?",
"Estas trabajando y te llega un correo de un supuesto compañero que dice: 'Hola, estoy teniendo una mañana ocupada, estoy preparando una sorpresa para los jefes de área, ¿Me podrías dar el email de tu jefe?'",
"Te llega un correo que dice: 'Hola, por favor renueva tu numero de cuenta para Haberes enviando el número de cuenta por este correo'¿Respondes el correo o prefieres preguntar a tu jefe si estan actualizando los datos de sus cuentas bancarias?"]

var respuesta=[false,false,true, true,false,true]
var textoNo= ["No entrego","No doy","Doy mi dirección", "Si les doy","Si le doy","Respondo"]
var textoSo= ["Si entrego","Sí doy","No me interesa", "NO les doy","No le doy","Pregunto"]

var respNo=["Felicidades!! Recuerda que los estafadores suelen ofrecer paquetes de viaje fraudulentos",
"MUY BIEN!! Recuerda el banco nunca te va a pedir tus datos personales por llamadas, siempre sera por su página web",
"OH NOOO!!! ¡¡TE ESTAFARON!! Siempre debes de resistir a la presión de tomar una decisión inmediatamente, los estafadores utilizan esa técnica para engañar",
"CUIDADO!! Puedes ser victima de PRETEXTING, si tienes duda consulta directamente con el jefe de tu área o del área que solicita la información si están haciendo algunas actualizaciones de políticas en la empresa.",
"FELICIDADES!!! Evitaste el PRETEXTING, usualmente el hacker va a buscar información de algún superior para poder obtener información confidencial de la empresa.",
"Oh no!! Fuiste víctima de pretexting, recuerda que las empresas siempre avisan sobre la actualización de datos"]

var respSi=["Te estafaron!!!! Recuerda que los estafadores suelen ofrecer paquetes de viaje fraudulentos",
"Oh no!! Recuerda el banco nunca te va a pedir tus datos personales por llamadas, siempre será por su página web",
"Felicidades!! Siempre debes de resistir a la presión de tomar una decisión inmediatamente, los estafadores utilizan esa técnica para engañar",
"MUY BIEN!!! Evitaste el PRETEXTING, si tienes duda consulta directamente con el jefe de tu área o del área que solicita la información si están haciendo algunas actualizaciones de políticas en la empresa.",
"Cuidado!!!!, puedes ser víctima de PRETEXTING, usualmente el hacker va a buscar información de algún superior para poder obtener información confidencial de la empresa.",
"EXCELENTE!! Evitaste el pretexting, recuerda que las empresas siempre avisan sobre la actualización de datos"]

var concepto="El pretexting o pretexto es el acto de crear un falso escenario apelando a la confianza humana para que no solo revele información, sino también para que logre hacer alguna acción."

func preguntas(con,list):
	if (con<5):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje = puntaje + 1

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
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Pretexting")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
