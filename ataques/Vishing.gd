extends Node2D

func _ready():
	$Node2D2.vish = false
	$"Node2D2/TileMap/DumpsterDiving ".hide()
	$Node2D2/TileMap/Baiting.hide()
	$Node2D2/TileMap/Pretexting.hide()
	$Node2D2/TileMap/Phishing.hide()
	$Node2D2/TileMap/ShoulderSurfing.hide()
	$Node2D2/TileMap/Vishing.hide()
	$"Node2D2/TileMap/B-No".show()
	$"Node2D2/TileMap/B-Si".show()
	$"Node2D2/TileMap/B-No".text=textoNo[contador]
	$"Node2D2/TileMap/B-Si".text=textoSo[contador]
	preguntas(0,lista)
	
	

var contador=0
var puntaje=0
var resp=true

var lista=["Pablito está caminando a reunirse con sus amigos y recibe un SMS que dice se ha efectuado una compra con su tarjeta de crédito y le piden que confirme la compra llamando el siguiente número “9999xxxx”. Le llama y le piden su número de DNI y de tarjeta \n¿Es correcto que un banco le pida información por un mensaje de texto?",
"Horas más tarde, Pablito está en el bus camino a su destino y recibe una llamada del banco pidiéndole digitar su número de DNI para poder acceder a beneficios extra de su cuenta. \n¿Debería digitar su número de DNI?",
"Ya en el lugar con tus amigos, recibe un SMS pidiéndole ingresar al siguiente link porque hay actividad sospechosa en su cuenta. \n¿Qué debería hacer Pablito?",
"Cuando termina su reunión, recibe una llamada que dice: \n'FELICIDADES, ganaste un concurso para un auto 0 kilómetros, tan solo manda tu DNI y dirección para dejar tu nuevo auto en la puerta de tu casa'. \n¿Debería Pablito dar sus datos personales? ",
"Al llegar a su casa, su mamá recibe una llamada que dice: \n'Felicidades señora se acaba de ganar un iPhone7, para recibir su nuevo teléfono con linea nueva, debe recargar el siguiente número con tan solo 20 soles: 934xxxxxx'. Su mamá le pide que recargue el número. \n¿Qué debería hacer Pablito? "]

var respuesta=[false,false,true,true,true]
var textoNo= ["No lo es","No debe","Hace clic","Si debe","Recargar"]
var textoSo= ["Si lo es","Sí debe","No hace caso","No debe", "No recargar"]

var respNo=["Felicidades!! Pablito logró evitar el VISHING!! \nRecuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Felicidades!! Pablito evito el VISHING!! \nRecuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Oh no!!! ¡¡Le robaron la cuenta a Pablito!! \nEl banco nunca te va a pedir que ingreses directo de un link enviado por mensaje de texto, siempre entra por tu propia cuenta a la página oficial de los bancos",
"CUIDADO!! Pablito podría ser víctima de vishing!!! \nHay personas que llaman fraudulentamente para sacar información o dinero",
"CUIDADO!! Pablito podría ser víctima de vishing!!! \nHay personas que llaman fraudulentamente para sacar información o dinero ",
""]
var respSi=["Oh no!! \nRecuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Oh no!! \nRecuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Felicidades!! Pablito evito el VISHING!!\nEl banco nunca te va a pedir que ingreses directo de un link enviado por mensaje de texto, siempre entra por tu propia cuenta a la página oficial de los bancos",
"Felicidades!! Pablito evito el VISHING!! \nEvitaste ser víctima de vishing, hay personas que llaman fraudulentamente para sacar información o dinero, si no recuerdas haber participado en algún concurso, no debes de aceptar ese tipo de llamadas ",
"Muy Bien!!!Pablito evito el VISHING!! \nEvitaste ser víctima de vishing, hay personas que llaman fraudulentamente para sacar información o dinero, si no recuerdas haber participado en algún concurso, no debes de aceptar ese tipo de llamadas"]

var concepto="El vishing es un ataque muy parecido al phishing, con la diferencia que el vishing utiliza exclusivamente el medio TELEFÓNICO."

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
		print("Ya hiciste Vishing")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
