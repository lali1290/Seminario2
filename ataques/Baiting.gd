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
var lista=["Pablito esta caminando por la Universidad y te encuentra un USB. \n¿Crees que es peligroso encontrarse un USB tirado en la calle?",
"Pablito te dice: \n¿Sabías que podrías encontrar un virus en un USB o CD?",
"Su amigo llega y le dice que encontro un pendrive en un escritorio de la universidad \n¿Esta bien que lo conecte directo a su pc?",
""]

var respuesta=[false,false,true]
var textoNo= ["No","No sabía","Si"]
var textoSo= ["Sí","Si sabía","No"]

var respNo=["Felicidades!! Evitaste que Pablito sufriera el ataque Baiting. \nSi encuentras un USB tirado en la universidad o en cualquier otro lado, es preferible entregarlo a objetos perdidos a arriesgarte",
"MUY BIEN! \nMuchos hackers se aprovechan de este objeto físico que parece inofensivo para implantar malwares, debes de tener cuidado con los pendrives que ingresan a tu computadora",
"OH NO!! Infectaron su computadora \nSi encuentras un USB tirado en la universidad o en cualquier otro lado, es preferible entregarlo a objetos perdidos a arriesgarte",
""]
var respSi=["OH NOOO!! Pablito sufrió el ataque Baiting \nSi encuentras un USB tirado en la universidad o en cualquier otro lado, es preferible entregarlo a objetos perdidos a arriesgarte",
"INFECTARON SU CAMPUTADORA!!! \nMuchos hackers se aprovechan de este objeto físico que parece inofensivo para implantar malwares, debes de tener cuidado con los pendrives que ingresan a tu computadora",
"EXCELENTE!! No infectaron la computadora de su amigo \nSi encuentras un USB tirado en la universidad o en cualquier otro lado, es preferible entregarlo a objetos perdidos a arriesgarte",
""]

var concepto= "El ataque Baiting se aprovecha de la codicia y curiosidad de los usuarios utilizando medios físicos o softwares y artículos en línea para infectarlos con un malware y así dañar a sus víctimas. "

func preguntas(con,list):
	
	if (con<3):
		$Node2D2/TileMap/Label.text= list[con]
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".text=textoNo[con]
		$"Node2D2/TileMap/B-Si".text=textoSo[con]

func correctas(coso):
	if (coso == respuesta[contador]):
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(0, 0, 71, 1))
		puntaje = puntaje + 1
		#$Node2D2.puntaje_total= $Node2D2.puntaje_total+1
	else:
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(255, 0, 0, 1))

func _on_Node2D2_botonN():
	correctas(false)
	$"Node2D2/TileMap/B-No".hide()
	$"Node2D2/TileMap/B-Si".hide()
	$Node2D2/TileMap/Advertencia.text= respNo[contador]
	contador= contador + 1
	preguntas(contador,lista)
	print("Tu puntaje es: "+str(puntaje))
	$Node2D2/TileMap/Score.text = str($"/root/PantallaAtaques".puntaje_total)
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
	print("Tu puntaje es: "+str(puntaje))
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
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(0,0,0, 1))
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Baiting")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
