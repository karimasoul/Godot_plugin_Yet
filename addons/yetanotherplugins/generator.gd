@tool
extends Node


# for teste

func generate_main_menu():
	var menu = Control.new()
	menu.name = "TesteUIMain"
	#menu.anchor_right = 1
	#menu.anchor_bottom = 1

# background
	var fond = TextureRect.new()
	fond.name = "BG"
	fond.texture = load("res://assets/91657.jpg")
	fond.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	fond.anchor_right = 1
	fond.anchor_bottom = 1
	menu.add_child(fond)
	fond.owner = menu  
# hbox qui contient tout
	var OverallBox = HBoxContainer.new()
	OverallBox.name = "OverallBox"
	
	OverallBox.anchor_right = 1
	OverallBox.anchor_bottom = 1
	menu.add_child(OverallBox)
	OverallBox.owner = menu
	
# contenu du Hbox

	var UnpauseBtn = TextureButton.new()
	UnpauseBtn.name = "UnpauseBtn"
	
	UnpauseBtn.anchor_right = 1
	UnpauseBtn.anchor_bottom = 1
	OverallBox .add_child(UnpauseBtn)
	UnpauseBtn.owner = menu
	
	
	
	
	
	
	
	
	#
	#var titre = Label.new()
	#titre.text = "My Game"
	#titre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	#titre.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	#titre.anchor_left = 0.5
	#titre.anchor_top = 0.1
	#fond.add_child(titre)
	#titre.owner = menu 
#
	#
	#var vbox = VBoxContainer.new()
	#vbox.anchor_left = 0.5
	#vbox.anchor_top = 0.5
	#vbox.position = Vector2(-50, -50)
	#fond.add_child(vbox)
	#vbox.owner = menu 
#
	#
	#for t in ["Pause", "Parameter", "Exit"]:
		#var btn = Button.new()
		#btn.text = t
		#vbox.add_child(btn)
		#btn.owner = menu  

	
	var scene = PackedScene.new()
	scene.pack(menu)
	var path = "res://menu.tscn"
	var err = ResourceSaver.save(scene, path)
	if err == OK:
		print("Scène générée :", path)
	else:
		push_error("Erreur sauvegarde scène")
