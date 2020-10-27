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

var lista=["Pablito esta yendo al trabajo le llega un mensaje SMS del BCP, dice: 'Buenas Tardes, para brindar mayor seguridad tienes que confirmar estos datos, por favor contestar el mensaje con su número de cuenta y contraseña para la confirmación'. /n ¿Él debería mandar el mensaje con sus datos?",
"A Pablito le llega el correo de un desconocido, /n ¿Abre o no el correo?",
"Más tarde, le llega un correo con visibles errores ortográficos, /n¿Qué crees que hace Pablo, abre o no el correo?",
"Después de trabajar, Pablito decide ir a tomarte una ducha, al salir ve que su mamá le ha enviado un mensaje que dice “Donaciones para los niños pobres, por favor haga sus donaciones ingresando sus datos bancarios en este link, 'https://www.viabcp.com/donacionesanonimasparaelcuidadodeniñospobresenlasierradelpais'. /n¿Pablito abre o no el SOSPECHOSO link?",
"Pablito es un empleado de una organización, un día, recibe una llamada del “Área de Mantenimiento” preguntándote por el usuario y contraseña de su máquina para una revisión protocolar, el no sabía de la revisión protocolar. /n¿Debería darle sus datos?",
"Pablito recibe un mensaje de su primo(a) que dice ‘Comparte este link con 3 amigos para tener Spotify gratis por 3 meses’ /n¿Crees que Pablito comparte el link?"]

var respuesta=[true,false,false,false, true, true]
var textoNo= ["No abre","No","No","No lo abre","Si da", "Si"]
var textoSo= ["Si abre","Sí","Sí","Sí lo abre","No da","No"]

var respNo=["Oh no!! Pablito fue víctima de phishing!!! \n Recuerda que un banco nunca te va a pedir datos por SMS",
"Felicidades!!! /n Es preferible no abrir correos de remitentes desconocidos",
"Felicidades!!! /n un correo verídico no debería de tener errores ortográficos",
"FELICIDADES!! /n Pablito evitó el phishing, recuerda que un link no debe tener un nombre tan largo en el dominio",
"OH NO!! Le robaron a Pablito!! /n Recuerda que siempre te van a informar sobre las fechas de mantenimiento o revisión en el área, si alguien te llama y no está la revisión, es porque estas siendo engañado.",
"CUIDADOOOO!! Pablito puede ser víctima de PHISHING!! /n Los mensajes enviados por cadena son usualmente spam"]

var respSi=["Bien!! /n Un banco nunca te va a pedir datos por SMS",
#"Ten cuidado, si bien no es malo, hay una alta probabilidad de que te engañen",
"CUIDADO! /n Un correo verídico no debería tener errores ortográficos",
"Ten CUIDADO!!!! /n Asegúrate de la veracidad de la página antes de hacer alguna transacción",
"OH NO!! Pablito fue víctima de phishing!!  /n  Recuerda que un link no debe tener un nombre tan largo en el dominio",
"FELICIDADES!! /n Recuerda que siempre te van a informar sobre las fechas de mantenimiento o revisión en el área, si alguien te llama y no está la revisión, es porque estas siendo engañado.",
"Muy Bien!! /n Evitaste que Pablo sufriera el PHISHING los mensajes enviados por cadena son usualmente spam"]

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
