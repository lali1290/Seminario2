extends Node2D
func _ready():
	
	pass

signal botonS
signal botonN
signal Continuar
var puntaje_total=0
var phis
var bat
var pret
var dump
var vish
var shoud

func _on_BNo_pressed():	emit_signal("botonN")
func _on_BSi_pressed():	emit_signal("botonS")

func _on_Phishing_pressed():return get_tree().change_scene("res://ataques/phishing.tscn")
	#if (phis==true):
	#	return get_tree().change_scene("res://ataques/phishing.tscn")
	#	phis=false
	#else:
	#	$TileMap/Phishing.disabled

func _on_ShoulderSurfing_pressed():return get_tree().change_scene("res://ataques/Shouldersurfing.tscn")
	#if (shoud==true):
	#	
	#else:
	#	$TileMap/Baiting.disabled
func _on_DumpsterDiving__pressed():return get_tree().change_scene("res://ataques/DumpsterDiving.tscn")
	#if (dump==true):
	#	
	#else:
	#	$"TileMap/DumpsterDiving ".disabled
func _on_Pretexting_pressed(): return get_tree().change_scene("res://ataques/Pretexting.tscn")
	#if (pret==true):
	#	
	#else:
	#	$TileMap/Pretexting.disabled
func _on_Baiting_pressed():return get_tree().change_scene("res://ataques/Baiting.tscn")
#	bat=true
#	if (bat==true):
#		
#	else:
#		$TileMap/Baiting.disabled
func _on_Vishing_pressed():return get_tree().change_scene("res://ataques/Vishing.tscn")

func _on_Continuar_pressed():
	emit_signal("Continuar")

