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
var lista=["Recibes una llamada desconocida, te dicen que ganaste un concurso y te piden tus datos para poder entregarte el premio, ¿Les entregas tus datos?",
"Recibes una llamada de un banco pidiéndote tus datos personales para que actualicen tu información, ¿Das tu información?",
"Recibes una llamada diciendo que usted se ha ganado una importante cantidad de dinero en un sorteo de lotería extranjera. Necesitan que ahora mismo des tu dirección para que te manden el premio directo a tu casa. Tienes 10 segundos para dar tu dirección o pierdes el premio.¿Que eliges?"]

var respuesta=[false,false,false]
var textoNo= ["No entrego","No doy","No"]
var textoSo= ["Si entrego","Sí doy","Sí"]

var respNo=[]
var respSi=[]

var concepto="El pretexting o pretexto es el acto de crear un falso escenario apelando a la confianza humana para que no solo revele información, sino también para que logre hacer alguna acción."

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
	elif(contador==4):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")
