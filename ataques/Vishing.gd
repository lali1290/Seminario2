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
var lista=["Recibes un SMS de que se ha efectuado una compra con tu tarjeta de crédito y te piden que confirmes la compra llamando el siguiente numero “9999xxxx”. Llamas y te piden tu numero de DNI Y de tarjeta, ¿Es correcto que un banco te pida información por teléfono?",
"Recibes una llamada del banco pidiéndote digitar tu número de DNI para poder acceder a beneficios extra de tu cuenta. ¿Digitas tu número de DNI?",
"Recibes un SMS pidiéndote ingresar al siguiente link porque hay actividad sospechosa en tu cuenta. ¿Qué haces?"]

var respuesta=[false,false,false]

var textoNo= ["No","No","No"]
var textoSo= ["Si","Sí","Sí"]
var concepto="El vishing es un ataque muy parecido al phishing, con la diferencia que el vishing utiliza exclusivamente el medio telefónico."

func preguntas(con,list):
	if (con<3):
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
	if (contador<3):
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
