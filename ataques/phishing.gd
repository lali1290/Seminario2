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
var lista=["Antes de llegar te llega un mensaje SMS del BCP, dice: 'Buenas Tardes, para brindar mayor seguridad tienes que confirmar estos datos, por favor contestar el mensaje con su número de cuenta y contraseña para la confirmación'. ¿Deberías mandar el mensaje con tus datos?",
 "Te llega el correo de un desconocido, ¿Abres el correo?",
"Te llega un correo con visibles erroes ortograficos, ¿Abres el correo?",
"Después de trabajar decides ir a tomarte una ducha, al salir ves que tu mamá te ha enviado un mensaje que dice “Donaciones para los niños pobres, por favor haga sus donaciones ingresando sus datos bancarios en este SOSPECHOSO link, 'https://www.viabcp.com/donacionesanonimasparaelcuidadodeniñospobresenlasierradelpais'. ¿Abres el link?"]

var respuesta=[false,false,false,false]
var textoNo= ["No abro","No","No","No lo abro"]
var textoSo= ["Si abro","Sí","Sí","Sí lo abro"]

var respNo=["Oh no!! Un banco nunca te va a pedir datos por SMS","Felicidades, Es preferible no abrir correos de remitentes desconocidos",
"Felicidades, un correo veridico no deberia de tener errores ortograficos",
"Muy Bien, Los mensajes enviados por cadena son usualmente spam","El phishing es un acto de engaño mediante en el cual se utiliza la suplantación para obtener información de la víctima."]

var respSi=["Bien!! Un banco nunca te va a pedir datos por SMS","Ten cuidado, si bien no es malo, hay una alta probabilidad de que te engañen",
"CUIDADO! un correo verídico no debería tener errores ortograficos",
"Ten cuidado, asegurate de la veracidad de la página antes de hacer alguna transacción",
"El phishing es un acto de engaño mediante en el cual se utiliza la suplantación para obtener información de la víctima."]

var concepto="El phishing es un acto de engaño mediante en el cual se utiliza la suplantación para obtener información de la víctima."

func preguntas(con,list):
	if (con<4):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje = puntaje + 1
		#$Node2D2.puntaje_total= $Node2D2.puntaje_total+1

func _on_Node2D2_botonN():
	correctas(false)
	$"Node2D2/TileMap/B-No".hide()
	$"Node2D2/TileMap/B-Si".hide()
	$Node2D2/TileMap/Advertencia.text= respNo[contador]
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)#"Contados: " + 
	print(puntaje)#"Punteje: " + 
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
	print(contador)#"Contados: " + 
	print(puntaje)#"Punteje: " + 
	$Node2D2/TileMap/Label.hide()
	$Node2D2/TileMap/Continuar.show()
	$Node2D2/TileMap/Advertencia.show()


func _on_Node2D2_Continuar():
	if (contador<4):
		$Node2D2/TileMap/Advertencia.hide()
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".show()
		$"Node2D2/TileMap/B-Si".show()
		$Node2D2/TileMap/Continuar.hide()
	elif(contador==4):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")
	
