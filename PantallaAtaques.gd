extends Node2D

signal botonS
signal botonN
var puntaje_total
func _on_BNo_pressed():
	emit_signal("botonN")

func _on_BSi_pressed():
	emit_signal("botonS")


