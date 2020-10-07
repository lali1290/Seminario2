extends Node2D

func _ready():
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
var lista=["Estas caminando y recibes un SMS de que se ha efectuado una compra con tu tarjeta de crédito y te piden que confirmes la compra llamando el siguiente número “9999xxxx”. Llamas y te piden tu número de DNI Y de tarjeta, ¿Es correcto que un banco te pida información por un mensaje de texto?",
"Hoas más tarde, estas en el bus camino a tu destino y recibes una llamada del banco pidiéndote digitar tu número de DNI para poder acceder a beneficios extra de tu cuenta. ¿Digitas tu número de DNI?",
"Ya en el lgar con tus amigos, recibes un SMS pidiéndote ingresar al siguiente link porque hay actividad sospechosa en tu cuenta. ¿Qué haces?",
"Cuando terminana su reunión, recibes una llamada que dice:'FELICIDADES, ganaste un concurso para un auto 0 kilómetros, tan solo manda tu DNI y dirección para dejar tu nuevo auto en la puerta de tu casa'. ¿Das tus datos personales? ",
"Llegas a tu casa ay tu mamá tecibe una llamada que dice: 'Fecicidades se;ora se acaba de ganar un iPhone7, para recibir su nuevo telefono con linea, debe reargar el siguiente número con tan solo 20 soles: 934xxxxxx'. tu mamá te pide que recarges el número. ¿Que haces? ",
""]

var respuesta=[false,false,true,true,true]

var textoNo= ["No lo es","No doy","Hago clic","Si doy","Recargo"]
var textoSo= ["Si lo es","Sí doy","No hago caso","No doy", "No recargo"]

var respNo=["Felicidades!! Recuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Felicidades!! Recuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Oh no!!! ¡¡Te robaron la cuenta!! El banco nunca te va a pedir que ingreses directo de un link enviado por mensaje de texto, siempre entra por tu propia cuenta a la página oficial de los bancos",
"CUIDADO!! Podrias ser victíctima de vishing, hay personas que llaman fradulentamente para sacar infromación o dinero",
"CUIDADO!! Podrias ser victíctima de vishing, hay personas que llaman fradulentamente para sacar infromación o dinero",
""]
var respSi=["Oh no!! Recuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Oh no!! Recuerda que el banco nunca te va a pedir que envíes información por mensaje de texto",
"Felicidades!! El banco nunca te va a pedir que ingreses directo de un link enviado por mensaje de texto, siempre entra por tu propia cuenta a la página oficial de los bancos",
"Felicidades!! Evitaste ser victíctima de vishing, hay personas que llaman fradulentamente para sacar infromación o dinero, si no recuerdas haber participado en algún concurso, no deberias de aceptar ese tipo de llamadas",
"Muy Bien!! Evitaste ser victíctima de vishing, hay personas que llaman fradulentamente para sacar infromación o dinero, si no recuerdas haber participado en algún concurso, no deberias de aceptar ese tipo de llamadas",
""]

var concepto="El vishing es un ataque muy parecido al phishing, con la diferencia que el vishing utiliza exclusivamente el medio TELEFÓNICO."

func preguntas(con,list):
	if (con<5):
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
		print("Ya hiciste Vishing")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
