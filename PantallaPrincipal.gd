extends Node2D

func _ready():
	pass # Replace with function body.

func siguente ():
	$TextureRect/CenterContainer/Button.pressed
	
	
var contador = 0
func _on_Button_pressed():
	if contador== 0:
		$TextureRect/MarginContainer/VSplitContainer/Label.text = "Este juego quiere enseñarte sobre los atauqes de ingenieria social"
		contador=1
	elif contador== 1: 
		$TextureRect/MarginContainer/VSplitContainer/Label.text = "La ingenieria social es"
		contador = 2
	elif contador==2:
		get_tree().change_scene("res://PantallaAtaques.tscn")
	$TextureRect/MarginContainer/VSplitContainer/Label.show()
	$TextureRect/MarginContainer/VSplitContainer/CenterContainer/Button.text ="Continuar"
