extends Node2D

func _ready():
	$Node2D/TileMap/Baiting.hide()
	$Node2D/TileMap/Pretexting.hide()
	$Node2D/TileMap/Phishing.hide()
	$Node2D/TileMap/ShoulderSurfing.hide()
	$Node2D/TileMap/Vishing.hide()
	$"Node2D/TileMap/DumpsterDiving ".hide()
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
var respuesta=[false,true,true,false]
var textoNo= ["Pared","No cubro","No","No"]
var textoSo= ["Cualquier Lugar","Sí cubro","Sí","Sí"]

var respNo=[]
var respSi=[]
var concepto="El Shoulder Surfing consiste en utilizar técnicas de observación, como dice su nombre, para mirar sobre el hombro de la víctima para obtener información personas relacionada con la información de seguridad tales como contraseñas o información sensible. "

func preguntas(con,list):
	if (con<4):
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
	if (contador<4):
		$Node2D2/TileMap/Advertencia.hide()
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".show()
		$"Node2D2/TileMap/B-Si".show()
		$Node2D2/TileMap/Continuar.hide()
	elif(contador==4):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")
