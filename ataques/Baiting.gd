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
var lista=["¿Crees que es peligroso encontrarse un USB tirado en la calle?","Encontraste un USB tirado en la calle, ¿Lo recoges?"]
var respuesta=[false,false]
var textoNo= ["No","No lo tomo"]
var textoSo= ["Sí","Si lo tomo"]
var concepto= "El ataque Baiting se aprovecha de la codicia y curiosidad de los usuarios utilizando medios físicos o softwares y artículos en línea para infectarlos con un malware y así dañar a sus víctimas. "

var respNo=[]
var respSi=[]
var conceptop="El ataque Baiting podría compararse con el Caballo de Troya, este se aprovecha de la codicia y curiosidad de los usuarios utilizando medios físicos o softwares y artículos en línea para infectarlos con un malware y así dañar a sus víctimas."

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
