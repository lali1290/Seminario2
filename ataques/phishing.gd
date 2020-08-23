extends Node2D

func _ready():
	$"Node2D2/TileMap/B-No".show()
	$"Node2D2/TileMap/B-Si".show()
	$"Node2D2/TileMap/B-No".text=textoNo[contador]
	$"Node2D2/TileMap/B-Si".text=textoSo[contador]
	preguntas(0,lista)
	pass # Replace with function body.

var contador=0
var puntaje=0
var resp=true
var lista=["Antes de llegar te llega un mensaje SMS del BCP, dice: 'Buenas Tardes, para brindar mayor seguridad tienes que confirmar estos datos, por favor contestar el mensaje con su número de cuenta y contraseña para la confirmación'. ¿Deberías mandar el mensaje con tus datos?",
 "Te llega el correo de un desconocido, ¿Abres el correo?",
"Te llega un correo con visibles erroes ortograficos, ¿Abres el correo?",
"Después de trabajar decides ir a tomarte una ducha, al salir ves que tu mamá te ha enviado un mensaje que dice “Donaciones para los niños pobres, por favor haga sus donaciones ingresando sus datos bancarios en este SOSPECHOSO link, 'https://www.viabcp.com/donacionesanonimasparaelcuidadodeniñospobresenlasierradelpais'. ¿Abres el link?"]
var respuesta=[false,false,false,false]
var textoNo= ["No abro","No","No","No lo abro"]
var textoSo= ["Si abro","Sí","Sí","Sí lo abro"]


func preguntas(con,list):
#	var yafue = lista.size()
	if (con<=3):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]
	else:
		return get_tree().change_scene("res://PantallaAtaques.tscn")

func correctas(coso):
	if (coso == respuesta[contador]):
		puntaje = puntaje + 1
		$Node2D2.puntaje_total=$Node2D2.puntaje_total+1

func _on_Node2D2_botonN():
	correctas(false)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)

func _on_Node2D2_botonS():
	correctas(true)
	contador= contador + 1
	preguntas(contador,lista)
	print(contador)
	print(puntaje)
