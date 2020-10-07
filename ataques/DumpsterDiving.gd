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
"Te dieron unos documentos para tirar. Te das cuenta de que esos documentos tienen información confidencial de la empresa. ¿Tiras documentos a la basura sin triturar o quemar?",
"Tu jefe te dio su numero en una nota adhesiva, luego de anotarla en tu teléfono, ¿Qué haces con ese papel, lo tiras simplemente a la basura o te asegurar de que el numero sea ininteligible antes de deshacerte del papel?",
"Has ido al médico a recoger los resultados médicos de tu jefe, una vez se los entregas, el te dice que te deshagas de ellos. ¿Cómo te deshaces de ellos?",
"Estas trabajando en una empresa y te das cuenta que tu credencial, con tu número de trabajador impreso en el carné, ya venció, ¿Crees que es mejor tirarlo simplemente o segurarse de destruirlo?"]

var respuesta=[false,false,true,true,false, true]
var textoNo= ["No","No pondría","No, solo los tiro","Lo tiro", "Los trituro", "Lo tiro"]
var textoSo= ["Si","Sí pondría","Sí, los trituro","Borro el numero", "Los tiro","Lo destruyo"]

var respNo=["Muy bien!! Poner contraseñas en una nota adhesiva es un grave error, evitaste que te roben algun tipo de información.",
"Felicidades!! Uno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines.",
"Oh no!! Alguien busco en la basura de la empresa y se robó información importante. Asegurate siempre de destruir los papeles con información importante, no solo los tires a la basura.",
"Oh no!! Recuerda que los ingenieros sociales buscan en la basura de las empresas, pueden buscar números de personas importantes dentro de la empresa para realizar otros ataques.",
"MUY BIEN!!!!!!\n Recuerda que un registro medico es información delicada, uno se tiene que deshacer correctamente de algún papel que tenga esa información personal, ya que se podría usar en contra de la persona mencionada en el registro.",
"¡¡OH NO!! Alguien busco en la basura y encontró tu credencial, ahora alguien esta suplantándote. Asegúrate de destruir todo lo que tenga alguna identificación de ti, ya sean papeles o carnés."]
var respSi=["Oh no!! Te robaron la contraseña de tu computadora",
"CUIDADO!! Uno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines.",
"Felicidades!! Evitaste el Dumpster Diving. Los papeles importantes deben ser destruidos de alguna forma si se quieren desahacer de ellos, no solo se tiran a la basura.",
"Felicidades!! Hiciste lo correcto!! Recuerda que los ingenieros sociales buscan en la basura de las empresas, pueden buscar números de personas importantes dentro de la empresa para realizar otros ataques.",
"OH NO!! Recuerda que un registro medico es información delicada, uno se tiene que deshacer correctamente de algún papel que tenga esa información personal, ya que se podría usar en contra de la persona mencionada en el registro",
"MUY BIEN!!!!! Siempre asegúrate de destruir todo lo que tenga alguna identificación de ti, ya sean papeles o carnés."]

var concepto="El Dumpster Diving es el acto de “escarbar” en la basura o equipos desechados de alguna empresa para así obtener documentos con información sensible de la empresa como, por ejemplo, material informático, CD, DVD, etc."

func preguntas(con,list):
	if (con<5):
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
	print("Tu puntaje es: "+str(puntaje))
	$Node2D2/TileMap/Label.hide()
	$Node2D2/TileMap/Continuar.show()
	$Node2D2/TileMap/Advertencia.show()


func _on_Node2D2_Continuar():
	if (contador<5):
		$Node2D2/TileMap/Advertencia.hide()
		$Node2D2/TileMap/Label.show()
		$"Node2D2/TileMap/B-No".show()
		$"Node2D2/TileMap/B-Si".show()
		$Node2D2/TileMap/Continuar.hide()
	elif(contador==5):
		$Node2D2/TileMap/Advertencia.text=concepto
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Dumpster Diving")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
