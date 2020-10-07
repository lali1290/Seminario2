extends Node2D

func _ready():
	$Node2D/TileMap/Baiting.hide()
	$Node2D/TileMap/Pretexting.hide()
	$Node2D/TileMap/Phishing.hide()
	$Node2D/TileMap/ShoulderSurfing.hide()
	$Node2D/TileMap/Vishing.hide()
	$"Node2D/TileMap/DumpsterDiving ".hide()
	pass # Replace with function body.
var contador = 0
var puntaje_total=0
func _on_Button_pressed():
	if contador== 0:
		$Node2D/TextureRect/Label.text = "Este juego quiere enseñarte sobre los ataques de ingenieria social, ataques que podrias sufrir en un dia común"
		contador=1
	elif contador== 1: 
		$Node2D/TextureRect/Label.text = "La ingenieria social es el uso de estrategias y técnicas para obtener información de las personas persuadiendo a los mismos para que divulguen información privada."
		contador = 2
	elif contador==2:
		return get_tree().change_scene("res://PantallaAtaques.tscn")
	$Node2D/TextureRect/Label.show()
	$Node2D/TextureRect/Button.text ="Continuar"

