extends Node2D

func _ready():
	$"Node2D/TileMap/B-No".show()
	$"Node2D/TileMap/B-Si".show()
	$"Node2D/TileMap/B-No".text=textoNo[contador]
	$"Node2D/TileMap/B-Si".text=textoSo[contador]
	preguntas(0,lista)

var contador=0
var puntaje=0
var resp=true
var lista=["Estas a punto de ver archivos importantes en una cafetería, ¿Te sientas en cualquier lugar o de espaldas a la pared?",
"Estas en un cajero automático sacando dinero y hay gente atrás, ¿Sueles cubrir el teclado con la mano al poner la contraseña?",
"Cuando dejas la computadora ¿La dejas desbloqueada?",
"Cuando buscas información financiera, ¿Lo haces en un lugar público?"]
var respuesta=[true,true,true,false]
var textoNo= ["Cualquier lugar","No cubro","No","No"]
var textoSo= ["Pared","Sí cubro","Sí","Sí"]

func preguntas(con,list):
#	var yafue = lista.size()
	if (con<=3):
		$Node2D/TileMap/Label.text= list[con]
		$Node2D/TileMap/Label.show()
		$"Node2D/TileMap/B-No".text=textoNo[con]
		$"Node2D/TileMap/B-Si".text=textoSo[con]
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje = puntaje + 1
		$Node2D2.puntaje_total=$Node2D2.puntaje_total+1

func _on_Node2D_botonN():
	correctas(false)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)

func _on_Node2D_botonS():
	correctas(true)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)
