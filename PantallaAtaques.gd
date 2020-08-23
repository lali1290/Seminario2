extends Node2D

signal botonS
signal botonN
var puntaje_total
#var hol=["f","fa","fe"]

func _on_BNo_pressed():
	#print(hol[3])
	emit_signal("botonN")

func _on_BSi_pressed():
	emit_signal("botonS")

