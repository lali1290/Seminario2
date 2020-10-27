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
var lista=["Pablito tiene que hacer muchas cosas hoy, primero va a un cajero automático para sacar dinero y se da cuenta que hay gente atrás de él formada en un afila. /n ¿Debería cubrir el teclado con la mano al poner la contraseña?",
"Pablito está llegando a una cafetería y tiene ver unos archivos importantes. /n ¿Qué debería hacer, sentarse en cualquier lugar o de espaldas a la pared?",
"Una vez visto los archivos, Pablito va al baño. /n ¿Debería dejar su laptop desbloqueada sobre la mesa?",
"El amigo de Pablito quiere entrar a su cuenta bancaria conectado al internet de la cafetería. /n ¿Qué debería hacer Pablito, dejarlo seguir o decirle que no continúe?"]

var respuesta=[ true,false, true,false]
var textoNo= ["No cubro","Pared","No","No siga"]
var textoSo= ["Sí cubro","Cualquier Lugar","Sí","Siga"]

var respNo=["Uy noo!! Le robaron la contraseña de su tarjeta. /n Recuerda siempre ser precavido(a) cuando ingresas la contraseña en un cajero, no sabes quién o qué puede estar observando",
"Felicidadeees!! Evitaste el SHOULDER SURFING!! /n Recuerda que alguien podría estar viéndote desde atrás y con información confidencial uno debe ser aún más precavido",
"Oh noo!! Pablito no logró evitar que le roben información!! /n Le robaron la información de su computadora. /n Debes de tener cuidado cuando dejas tu computadora, sobre todo si estas en algún lugar público como el trabajo",
"Felicidadeees!! /n Recuerda que nunca debes de buscar información personal en una wifi pública"]

var respSi=[
"Felicidadeees!! Pablito evitó que le roben información!! /n Recuerda siempre ser precavido(a) cuando ingresas la contraseña en un cajero, no sabes quién o qué puede estar observando",
"Uy no!! Pablito fue víctima de SHOULDER SURFING /n Recuerda que alguien podría estar viéndote desde atrás y con información confidencial uno debe ser aún más precavido",
"Felicidadeees!! Pablito evito el SHOULDER SURFING /n Recuerda siempre ser precavido(a) cuando ingresas la contraseña en un cajero, no sabes quién o qué puede estar observando",
"Felicidadeees!!Pablito evitó que le roben información!! /n Siempre debes de tener cuidado cuando dejas tu computadora, sobre todo si estas en algún lugar público como el trabajo",
"Oh no! ¡¡Le robaron información a Pablito!! /n Recuerda que nunca debes de buscar información personal en una wifi pública"]

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
		#$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(34,47,157))
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Shoulder Surfing")
		return get_tree().change_scene("res://PantallaAtaques.tscn")

