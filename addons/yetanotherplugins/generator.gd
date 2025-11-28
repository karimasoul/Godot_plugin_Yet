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
	
	#UnpauseBtn.anchor_right = 1
	#UnpauseBtn.anchor_bottom = 1
	OverallBox.add_child(UnpauseBtn)
	UnpauseBtn.owner = menu
	
# Vbox 

	var OptionsBox = VBoxContainer.new()
	OptionsBox.name = "OptionsBox"
	
	#OptionsBox.anchor_right = 0.5
	#OptionsBox.anchor_bottom = 0.5
	OverallBox.add_child(OptionsBox)
	OptionsBox.owner = menu
	
# TitleBox

	var TitleBox = VBoxContainer.new()
	TitleBox.name = "TitleBox"
	
	#TitleBox.anchor_right = 0.5
	#TitleBox.anchor_bottom = 0.5
	OptionsBox.add_child(TitleBox)
	TitleBox.owner = menu
	
	# Childs de Titlebox
	var TitleUnderBox1 = HBoxContainer.new()
	TitleUnderBox1.name = "TitleUnderBox"
	TitleBox.add_child(TitleUnderBox1)
	TitleUnderBox1.owner = menu
		#childs de titleunderbox
		#"
	var LeftFill1 = Control.new()
	LeftFill1.name = "LeftFill"
	TitleUnderBox1.add_child(LeftFill1)
	LeftFill1.owner = menu
	
	var Label1 = Label.new()
	Label1.name = "Label"
	TitleUnderBox1.add_child(Label1)
	Label1.owner = menu
	
	var RightFill1 = Control.new()
	RightFill1.name = "RightFill"
	TitleUnderBox1.add_child(RightFill1)
	RightFill1.owner = menu
		
		#"
	
	var Filler = Control.new()
	Filler.name = "Filler"
	TitleBox.add_child(Filler)
	Filler.owner = menu
	
	
	
#VolumeBox

	var VolumeBox = HBoxContainer.new()
	VolumeBox.name = "VolumeBox"
	
	#VolumeBox.anchor_right = 0.5
	#VolumeBox.anchor_bottom = 0.5
	OptionsBox.add_child(VolumeBox)
	VolumeBox.owner = menu
	
	#childs de volumebox
	var LeftFill2 = Control.new()
	LeftFill2.name = "LeftFill"
	VolumeBox.add_child(LeftFill2)
	LeftFill2.owner = menu
	
	var SoundButton2 = TextureButton.new()
	SoundButton2.name = "SoundButton"
	VolumeBox.add_child(SoundButton2)
	SoundButton2.owner = menu
	
	var VolumeLabel2 = Label.new()
	VolumeLabel2.name = "VolumeLabel"
	VolumeBox.add_child(VolumeLabel2)
	VolumeLabel2.owner = menu
	
	var SoundSlider2 = HSlider.new()
	SoundSlider2.name = "SoundSlider"
	VolumeBox.add_child( SoundSlider2)
	SoundSlider2.owner = menu
	
	var RightFill2 = Control.new()
	RightFill2.name = "RightFill"
	VolumeBox.add_child(RightFill2)
	RightFill2.owner = menu
	

# WindowBox
	
	var WindowBox = HBoxContainer.new()
	WindowBox.name = "WindowBox"
	
	#WindowBox.anchor_right = 0.5
	#WindowBox.anchor_bottom = 0.5
	OptionsBox.add_child(WindowBox)
	WindowBox.owner = menu
	
	#childs de windowbox
	
	var LeftFill3 = Control.new()
	LeftFill3.name = "LeftFill"
	WindowBox.add_child(LeftFill3)
	LeftFill3.owner = menu
	
	var WindowButton3 = TextureButton.new()
	WindowButton3.name = "WindowButton"
	WindowBox.add_child(WindowButton3)
	WindowButton3.owner = menu
	
	var WindowLabel3 = Label.new()
	WindowLabel3.name = "WindowLabel"
	WindowBox.add_child(WindowLabel3)
	WindowLabel3.owner = menu
	
	var Left3 = TextureButton.new()
	Left3.name = "Left"
	WindowBox.add_child(Left3)
	Left3.owner = menu
	
	var WindowLabel23 = Label.new()
	WindowLabel23.name = "WindowLabel2"
	WindowBox.add_child(WindowLabel23)
	WindowLabel23.owner = menu
	
	var Right3 = TextureButton.new()
	Right3.name = "Right"
	WindowBox.add_child(Right3)
	Right3.owner = menu
	
	var RightFill3 = Control.new()
	RightFill3.name = "RightFill"
	WindowBox.add_child(RightFill3)
	RightFill3.owner = menu
	
# ResolutionBox

	var ResolutionBox = HBoxContainer.new()
	ResolutionBox.name = "ResolutionBox"
	
	#ResolutionBox.anchor_right = 0.5
	#ResolutionBox.anchor_bottom = 0.5
	OptionsBox.add_child(ResolutionBox)
	ResolutionBox.owner = menu
	
	#childs de resolutionBox
	var LeftFill4 = Control.new()
	LeftFill4.name = "LeftFill"
	ResolutionBox.add_child(LeftFill4)
	LeftFill4.owner = menu
	
	var ResolutionButton4 = TextureButton.new()
	ResolutionButton4.name = "ResolutionButton"
	ResolutionBox.add_child(ResolutionButton4)
	ResolutionButton4.owner = menu
	
	var ResolutionLabel4 = Label.new()
	ResolutionLabel4.name = "ResolutionLabel"
	ResolutionBox.add_child(ResolutionLabel4)
	ResolutionLabel4.owner = menu
	
	var Left4 = TextureButton.new()
	Left4.name = "Left"
	ResolutionBox.add_child(Left4)
	Left4.owner = menu
	
	var ResolutionLabel24 = Label.new()
	ResolutionLabel24.name = "ResolutionLabel2"
	ResolutionBox.add_child(ResolutionLabel24)
	ResolutionLabel24.owner = menu
	
	var Right4 = TextureButton.new()
	Right4.name = "Right"
	ResolutionBox.add_child(Right4)
	Right4.owner = menu
	
	var RightFill4 = Control.new()
	RightFill4.name = "RightFill"
	ResolutionBox.add_child(RightFill4)
	RightFill4.owner = menu
	
	
# VerticalSyncBox

	var VerticalSyncBox = HBoxContainer.new()
	VerticalSyncBox.name = "VerticalSyncBox"
	
	#VerticalSyncBox.anchor_right = 0.5
	#VerticalSyncBox.anchor_bottom = 0.5
	OptionsBox.add_child(VerticalSyncBox)
	VerticalSyncBox.owner = menu
	
	#childs verticalSyncBox
	
	var LeftFill5 = Control.new()
	LeftFill5.name = "LeftFill"
	VerticalSyncBox.add_child(LeftFill5)
	LeftFill5.owner = menu
	
	var VetSyncButton5 = TextureButton.new()
	VetSyncButton5.name = "VertSyncButton"
	VerticalSyncBox.add_child(VetSyncButton5)
	VetSyncButton5.owner = menu
	
	var VetSyncLabel5 = Label.new()
	VetSyncLabel5.name = "VertSyncLabel"
	VerticalSyncBox.add_child(VetSyncLabel5)
	VetSyncLabel5.owner = menu
	
	var Left5 = TextureButton.new()
	Left5.name = "Left"
	VerticalSyncBox.add_child(Left5)
	Left5.owner = menu
	
	var VetSyncLabel25 = Label.new()
	VetSyncLabel25.name = "VertSyncLabel2"
	VerticalSyncBox.add_child(VetSyncLabel25)
	VetSyncLabel25.owner = menu
	
	var Right5 = TextureButton.new()
	Right5.name = "Right"
	VerticalSyncBox.add_child(Right5)
	Right5.owner = menu
	
	var RightFill5 = Control.new()
	RightFill5.name = "RightFill"
	VerticalSyncBox.add_child(RightFill5)
	RightFill5.owner = menu
	
# BackToMenuBox
	
	var BackToMenuBox = VBoxContainer.new()
	BackToMenuBox.name = "BackToMenuBox"
	OptionsBox.add_child(BackToMenuBox)
	BackToMenuBox.owner = menu
	
	#childs de backtomenubox
	
	var Filler6 = Control.new()
	Filler6.name = "Filler"
	BackToMenuBox.add_child( Filler6)
	Filler6.owner = menu
	
	var BackMenuUnderBox6 = HBoxContainer.new()
	BackMenuUnderBox6.name = "BackMenuUnderBox"
	BackToMenuBox.add_child(BackMenuUnderBox6)
	BackMenuUnderBox6.owner = menu
	
	 #childs de backmenuunderbox6
	
	var LeftFill6 = Control.new()
	LeftFill6.name = "LeftFill"
	BackMenuUnderBox6.add_child(LeftFill6)
	LeftFill6.owner = menu
	
	var Button6 = Button.new()
	Button6.name = "Button"
	BackMenuUnderBox6.add_child(Button6)
	Button6.owner = menu
	
	var RightFill6 = Control.new()
	RightFill6.name = "RightFill"
	BackMenuUnderBox6.add_child(RightFill6)
	RightFill6.owner = menu

# ResumeBox
	
	var ResumeBox = VBoxContainer.new()
	ResumeBox.name = "ResumeBox"
	OptionsBox.add_child(ResumeBox)
	ResumeBox.owner = menu
	
	#childs de Resumebox
	
	var Filler7 = Control.new()
	Filler7.name = "Filler"
	ResumeBox.add_child(Filler7)
	Filler7.owner = menu
	
	var ResumeUnderBox7 = HBoxContainer.new()
	ResumeUnderBox7.name = "ResumeUnderBox"
	ResumeBox.add_child(ResumeUnderBox7)
	ResumeUnderBox7.owner = menu
	
		#child resumeunderbox7
	var LeftFill7 = Control.new()
	LeftFill7.name = "LeftFill"
	ResumeUnderBox7.add_child(LeftFill7)
	LeftFill7.owner = menu
	
	var Button7 = Button.new()
	Button7.name = "Button"
	ResumeUnderBox7.add_child( Button7)
	Button7.owner = menu
	
	var RightFill7 = Control.new()
	RightFill7.name = "RightFill"
	ResumeUnderBox7.add_child(RightFill7)
	RightFill7.owner = menu

	
	
	
	
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
