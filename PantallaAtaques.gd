extends Node2D

signal botonS
signal botonN
signal Continuar
var puntaje_total

func _on_BNo_pressed():emit_signal("botonN")
func _on_BSi_pressed():emit_signal("botonS")

func _on_Phishing_pressed():return get_tree().change_scene("res://ataques/phishing.tscn")
func _on_ShoulderSurfing_pressed():return get_tree().change_scene("res://ataques/Shouldersurfing.tscn")
func _on_DumpsterDiving__pressed():return get_tree().change_scene("res://ataques/DumpsterDiving.tscn")
func _on_Pretexting_pressed():return get_tree().change_scene("res://ataques/Pretexting.tscn")
func _on_Baiting_pressed():return get_tree().change_scene("res://ataques/Baiting.tscn")
func _on_Vishing_pressed():return get_tree().change_scene("res://ataques/Vishing.tscn")

func _on_Continuar_pressed():
	emit_signal("Continuar")
