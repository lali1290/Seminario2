extends Node2D
export (Color,RGB) var colortexto

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
var lista=["Estas a punto de ver archivos importantes en una cafetería, ¿Te sientas en cualquier lugar o de espaldas a la pared?",
"Estas en un cajero automático sacando dinero y hay gente atrás, ¿Sueles cubrir el teclado con la mano al poner la contraseña?",
"Cuando dejas la computadora ¿La dejas desbloqueada?",
"Cuando buscas información financiera, ¿Lo haces en un lugar público?"]

var respuesta=[false,true,true,false]
var textoNo= ["Pared","No cubro","No","No"]
var textoSo= ["Cualquier Lugar","Sí cubro","Sí","Sí"]

var respNo=["Felicidadeees!! Recuerda que alguien podría estar viéndote desde atrás y con información confidencial uno debe ser aún más precavido",
"Uy noo!! Te robaron la contraseña de tu tarjeta, recuerda siempre ser precavido(a) cuando ingresas la contraseña en un cajero, no sabes quién o que puede estar observando",
"Oh noo!! Te robaron la información de tu computadora, debes de tener cuidado cuando dejas tu computadora, sobre todo si estas en algún lugar público como el trabajo",
"Felicidadeees!! Recuerda que nunca debes de buscar información personal en una wifi pública"]

var respSi=["Uy no!! Recuerda que alguien podría estar viéndote desde atrás y con información confidencial uno debe ser aún más precavido",
"Felicidadeees!! Recuerda siempre ser precavido(a) cuando ingresas la contraseña en un cajero, no sabes quién o que puede estar observando",
"Felicidadeees!! Siempre debes de tener cuidado cuando dejas tu computadora, sobre todo si estas en algún lugar público como el trabajo",
"Oh no! ¡¡Te robaron información!! Recuerda que nunca debes de buscar información personal en una wifi pública"]

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
	print("contador" + str(contador))
	print("Tu puntaje es: "+str(puntaje))
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
	print("contador" + str(contador))
	print("Tu puntaje es: "+str(puntaje))
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
		$Node2D2/TileMap/Advertencia
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(34,47,157))
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Shoulder Surfing")
		return get_tree().change_scene("res://PantallaAtaques.tscn")

