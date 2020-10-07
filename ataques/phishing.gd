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

var lista=["Yendo al trabajo te llega un mensaje SMS del BCP, dice: 'Buenas Tardes, para brindar mayor seguridad tienes que confirmar estos datos, por favor contestar el mensaje con su número de cuenta y contraseña para la confirmación'. ¿Deberías mandar el mensaje con tus datos?",
"Te llega el correo de un desconocido, ¿Abres el correo?",
"Te llega un correo con visibles errores ortográficos, ¿Abres el correo?",
"Después de trabajar decides ir a tomarte una ducha, al salir ves que tu mamá te ha enviado un mensaje que dice “Donaciones para los niños pobres, por favor haga sus donaciones ingresando sus datos bancarios en este SOSPECHOSO link, 'https://www.viabcp.com/donacionesanonimasparaelcuidadodeniñospobresenlasierradelpais'. ¿Abres el link?",
"Eres un empleado de una organización, recibes una llamada del “Área de Mantenimiento” preguntándote por tu usuario y contraseña de tu máquina para una revisión protocolar, tu no sabias de la revisión protocolar. ¿Le das tus datos?",
"Recibes un mensaje de tu primo(a) que dice “Comparte este link con 3 amigos para tener Spotify gratis por 3 meses” ¿Compartes el link?"]

var respuesta=[false,false,false,false, true, true]
var textoNo= ["No abro","No","No","No lo abro","Si doy", "Si"]
var textoSo= ["Si abro","Sí","Sí","Sí lo abro","No doy","No"]

var respNo=["Oh no!! Fuiste víctima de phishing!!! \n Recuerda que un banco nunca te va a pedir datos por SMS",
"Felicidades, Es preferible no abrir correos de remitentes desconocidos",
"Felicidades, un correo verídico no debería de tener errores ortográficos",
"FELICIDADES!! Evitaste el phishing, recuerda que un link no debe tener un nombre tan largo en el dominio",
"OH NO!! Te robaron!! Recuerda que siempre te van a informar sobre las fechas de mantenimiento o revisión en el área, si alguien te llama y no esta la revisión, es porque estas siendo engañado.",
"CUIDADOOOO!! Puedes ser víctima de PHISHING los mensajes enviados por cadena son usualmente spam"]

var respSi=["Bien!! Un banco nunca te va a pedir datos por SMS","Ten cuidado, si bien no es malo, hay una alta probabilidad de que te engañen",
"CUIDADO! un correo verídico no debería tener errores ortográficos",
"Ten cuidado, Asegúrate de la veracidad de la página antes de hacer alguna transacción",
"OH NO!! Evitaste el phishing, recuerda que un link no debe tener un nombre tan largo en el dominio",
"FELICIDADES!! Recuerda que siempre te van a informar sobre las fechas de mantenimiento o revisión en el área, si alguien te llama y no esta la revisión, es porque estas siendo engañado.",
"Muy Bien!! Evitaste el PHISHING los mensajes enviados por cadena son usualmente spam"]

var concepto="El phishing es un acto de engaño mediante en el cual se utiliza la suplantación para obtener información de la víctima."

func preguntas(con,list):
	if (con<6):
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
	if (contador<6):
		$Node2D2/TileMap/Advertencia.hide()
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".show()
		$"Node2D2/TileMap/B-Si".show()
		$Node2D2/TileMap/Continuar.hide()
	elif(contador==6):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Phishing")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
