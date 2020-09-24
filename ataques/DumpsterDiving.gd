extends Node2D

func _ready():
	$Node2D2/TileMap/Baiting.hide()
	$Node2D2/TileMap/Pretexting.hide()
	$Node2D2/TileMap/Phishing.hide()
	$Node2D2/TileMap/ShoulderSurfing.hide()
	$Node2D2/TileMap/Vishing.hide()
	$"Node2D2/TileMap/DumpsterDiving ".hide()
	$"Node2D2/TileMap/B-No".show()
	$"Node2D2/TileMap/B-Si".show()
	$"Node2D2/TileMap/B-No".text=textoNo[contador]
	$"Node2D2/TileMap/B-Si".text=textoSo[contador]
	preguntas(0,lista)

var contador=0
var puntaje=0
var resp=true

var lista=["¿Tienes la costumbre de escribir contraseñas en notas?",
"Eres el empleado de una gran empresa, tienes una computadora a la cual solo accedes por un usuario y contraseña que te dio la empresa. ¿Pondrías tu id y contraseña de tu computadora en un post-it?",
"Te dieron unos documentos para tirar. Te das cuenta que esos documentos tienen información confidencial de la empresa. ¿Tiras documentos a la basura sin triturar o quemar?"]

var respuesta=[false,false,true,false]
var textoNo= ["No","No pondría","No, solo los tiro","No"]
var textoSo= ["Si","Sí pondría","Sí, los trituo","Sí"]

var respNo=["Muy bien!! Poner contraseñas en una nota adhesiva es un grave error, evitaste que te roben algun tipo de información.",
"Felicidades!! Uno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines.",
"Oh no!! Alguien busco en la basura de la empresa y se robo información importante. Asegurate siempre de destruir los papeles con información importante, no solo los tires a la basura."]
var respSi=["Oh no!! Te robaron la contraseña de tu computadora",
"CUIDADO!! Uno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines.",
"Felicidades!! Evitaste el Dumpster Diving. Los papeles importantes deben ser destruidos de alguna forma si se quieren desahacer de ellos, no solo se tiran a la basura."]
var concepto="El Dumpster Diving es el acto de “escarbar” en la basura o equipos desechados de alguna empresa para así obtener documentos con información sensible de la empresa como, por ejemplo, material informático, CD, DVD, etc."

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
	elif(contador==3):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")
