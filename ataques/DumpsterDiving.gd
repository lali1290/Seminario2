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

var lista=["Pablito tiene la costumbre de escribir contraseñas en notas. \n¿Debería seguir haciéndolo o no?",
"Pablito es el empleado de una gran empresa, tiene una computadora a la cual solo accede por un usuario y contraseña que te dio la empresa. \n¿Deberia poner su id y contraseña de su computadora en un post-it?",
"A Pablito le dieron unos documentos para tirar. Se da cuenta de que esos documentos tienen información confidencial de la empresa. \n¿Debería tirar documentos a la basura sin triturar o quemar?",
"Su jefe le dio su número en una nota adhesiva, luego de anotarla en tu teléfono, \n¿Qué debería hacer con ese papel, lo tira simplemente a la basura o se asegura de que el número sea ininteligible antes de deshacerse del papel?",
"Pablito fue al médico a recoger los resultados médicos de tu jefe, una vez se los entregas, él le dice que se deshaga de ellos. \n¿Cómo se deshaces de ellos?",
"Pablito está trabajando en una empresa y se da cuenta que su credencial, con su número de trabajador impreso en el carné, ya venció. \n¿Debería tirarlo simplemente o asegurarse de destruirlo?"]

var respuesta=[false,false,true,true,false, true]
var textoNo= ["No más","No debe","Los tira","Lo tira", "Lo tritura", "Lo tira"]
var textoSo= ["Sigue","Si debe","Los tritura","Borra el numero", "Lo tira","Lo destruye"]

var respNo=[
"Muy bien!! \nPoner contraseñas en una nota adhesiva es un grave error, evitaste que le roben a Pablito algún tipo de información.",
"Felicidades!! \nUno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines.",
"Pablito está en problemas!! \nAlguien busco en la basura de la empresa y se robó información importante. Asegúrate siempre de destruir los papeles con información importante, no solo los tires a la basura.",
"Oh no!! Podrían despedir a Pablito!!! \nRecuerda que los ingenieros sociales buscan en la basura de las empresas, pueden buscar números de personas importantes dentro de la empresa para realizar otros ataques.",
"MUY BIEN!!!!!! \nRecuerda que un registro medico es información delicada, uno se tiene que deshacer correctamente de algún papel que tenga esa información personal, ya que se podría usar en contra de la persona mencionada en el registro.",
"¡¡OH NO!! \nAlguien busco en la basura y encontró la credencial de Pablito, ahora alguien está suplantándolo. \nAsegúrate de destruir todo lo que tenga alguna identificación de ti, ya sean papeles o carnés."]
var respSi=["Oh no!! \nSe robaron la contraseña de su computadora",
"CUIDADO!! \nUno nunca debe escribir sus contraseñas en notas adhesivas, cualquier persona podría entrar a tu computadora y usarla con malos fines. A Pablito le pueden robar información de su computadora.",
"Felicidades!! \nPablito y tu evitaron el Dumpster Diving. Los papeles importantes deben ser destruidos de alguna forma si se quieren desahacer de ellos, no solo se tiran a la basura, ya que cualquiera podría buscar los papeles en la basura y obtener es información. ",
"Felicidades!! Hiciste lo correcto!! \nRecuerda que los ingenieros sociales buscan en la basura de las empresas, pueden buscar números de personas importantes dentro de la empresa para realizar OTROS ATAQUES.",
"OH NO!! \nRecuerda que un registro medico es información delicada, uno se tiene que deshacer correctamente de algún papel que tenga esa información personal, ya que se podría usar en contra de la persona mencionada en el registro",
"MUY BIEN!!!!! \nSiempre asegúrate de destruir todo lo que tenga alguna identificación sobre ti, ya sean papeles o carnés."]

var concepto="El Dumpster Diving es el acto de “escarbar” en la basura o equipos desechados de alguna empresa para así obtener documentos con información sensible de la empresa como, por ejemplo, material informático, CD, DVD, etc."

func preguntas(con,list):
	if (con<5):
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
		$Node2D2/TileMap/Advertencia.add_color_override("font_color", Color(0,0,0, 1))
		contador = contador+1
	else:
		$"/root/PantallaAtaques".puntaje_total = $"/root/PantallaAtaques".puntaje_total + puntaje
		print("tu puntaje acumulado es:" + str($"/root/PantallaAtaques".puntaje_total))
		print("Ya hiciste Dumpster Diving")
		return get_tree().change_scene("res://PantallaAtaques.tscn")
