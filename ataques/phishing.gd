extends Node2D

func _ready():
	$"Node2D2/TileMap/B-No".show()
	$"Node2D2/TileMap/B-Si".show()
	preguntas(0)
	pass # Replace with function body.

var contador=0
var puntaje=0
var resp=true
var lista=["Es un dia como cualquier otroy ", "te llega el correo de un desconocido, ¿Abres el correo?","Te llega un correo con visibles erroes ortograficos, ¿Abres el correo?",""]
var respuesta=[true,false,true]

func preguntas(con):
	if (con<=lista.size()):
		$Node2D2/TileMap/Label.text= lista[con]
		$Node2D2/TileMap/Label.show()
	else:
		get_tree().change_scene("res://PantallaAtaques.tscn")

func _on_Node2D2_botonN():
	resp=false
	correctas(resp)
	contador= contador + 1
	preguntas(contador)
	print(contador)
	print(puntaje)

func _on_Node2D2_botonS():
	resp=true
	correctas(resp)
	contador= contador + 1
	preguntas(contador)
	print(contador)
	print(puntaje)

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje =+1
