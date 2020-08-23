extends Node2D

func _ready():
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
var textoNo= ["No abro","No","No"]
var textoSo= ["Si abro","Sí","Sí"]

func preguntas(con,list):
#	var yafue = lista.size()
	if (con<=2):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje = puntaje + 1
		$Node2D2.puntaje_total=$Node2D2.puntaje_total+1

func _on_Node2D2_botonN():
	correctas(false)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)

func _on_Node2D2_botonS():
	correctas(true)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)
