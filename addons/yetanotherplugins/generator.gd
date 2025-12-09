@tool
extends Node


# for teste
#gros blem ici çmr
func generate_main_menu():
	var menu = Control.new()
	menu.name = "TestUIMain"
	#menu.set_anchors_preset(Control.PRESET_FULL_RECT) anchors de merde
	menu.size = Vector2(1152.0, 648.0)
	menu.set_script(load("res://addons/yetanotherplugins/ScriptsScene/MenuPause.gd"))

# background
	var fond = TextureRect.new()
	fond.name = "BG"
	fond.texture = load("res://assets/91657.jpg")
	fond.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
	fond.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	
	#fond.layout_mode ça m'a fait chier 3h
	#fond.set_anchors_preset(Control.PRESET_FULL_RECT) ça m'a fait chier 3h

	
	fond.size = Vector2(1152.0, 648.0)
	fond.modulate = "#ffffff78"
	menu.add_child(fond)
	fond.owner = menu  

# hbox qui contient tout
	var OverallBox = HBoxContainer.new()
	OverallBox.name = "OverallBox"
	#OverallBox.layout_mode ça m'a fait chier 3h
	#OverallBox.set_anchors_preset(Control.PRESET_FULL_RECT) ça m'a fait chier 3h
	OverallBox.size = Vector2(1152.0,648.0)
	menu.add_child(OverallBox)
	OverallBox.owner = menu
	
# contenu du Hbox

	var UnpauseBtn = TextureButton.new()
	UnpauseBtn.name = "UnpauseBtn"
	#modif done
	UnpauseBtn.ignore_texture_size=true
	UnpauseBtn.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	UnpauseBtn.texture_normal = load("res://assets/cross2.png")
	UnpauseBtn.custom_minimum_size= Vector2(50.0,50.0)
	UnpauseBtn.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	#fin modif
	OverallBox.add_child(UnpauseBtn)
	UnpauseBtn.owner = menu
	UnpauseBtn.pressed.connect(
	Callable(menu, "_on_unpause_btn_pressed"),
	Object.CONNECT_PERSIST
	)

	
# Vbox 

	var OptionsBox = VBoxContainer.new()
	OptionsBox.name = "OptionsBox"
	#modif done
	OptionsBox.alignment = BoxContainer.ALIGNMENT_CENTER
	OptionsBox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	#fin modif
	OverallBox.add_child(OptionsBox)
	OptionsBox.owner = menu
	
# TitleBox

	var TitleBox = VBoxContainer.new()
	TitleBox.name = "TitleBox"
	#nada
	OptionsBox.add_child(TitleBox)
	TitleBox.owner = menu
	
	# Childs de Titlebox
	var TitleUnderBox1 = HBoxContainer.new()
	TitleUnderBox1.name = "TitleUnderBox"
	#nada
	TitleBox.add_child(TitleUnderBox1)
	TitleUnderBox1.owner = menu
		#childs de titleunderbox
		#"
	var LeftFill1 = Control.new()
	LeftFill1.name = "LeftFill"
	#modif done
	LeftFill1.size_flags_horizontal = Control.SIZE_EXPAND_FILL  
	#end modif
	TitleUnderBox1.add_child(LeftFill1)
	LeftFill1.owner = menu
	
	var Label1 = Label.new()
	Label1.name = "Label"
	#modif done
	Label1.text="TITLE"
	Label1.add_theme_font_size_override("font_size", 50)
	#end modif
	TitleUnderBox1.add_child(Label1)
	Label1.owner = menu
	
	var RightFill1 = Control.new()
	RightFill1.name = "RightFill"
	#modif done
	RightFill1.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
	#end modif
	TitleUnderBox1.add_child(RightFill1)
	RightFill1.owner = menu
		
		#"
	
	var Filler = Control.new()
	Filler.name = "Filler"
	#modif done
	Filler.custom_minimum_size=Vector2(0.0,50.0)
	#end modif
	TitleBox.add_child(Filler)
	Filler.owner = menu
	
	
	
#VolumeBox

	var VolumeBox = HBoxContainer.new()
	VolumeBox.name = "VolumeBox"
	#nada
	OptionsBox.add_child(VolumeBox)
	VolumeBox.owner = menu
	
	#childs de volumebox
	var LeftFill2 = Control.new()
	LeftFill2.name = "LeftFill"
	#modif done
	LeftFill2.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
	#end modif
	VolumeBox.add_child(LeftFill2)
	LeftFill2.owner = menu
	
	var SoundButton2 = TextureButton.new()
	SoundButton2.name = "SoundButton"
	#modif done
	SoundButton2.ignore_texture_size=true
	SoundButton2.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	SoundButton2.texture_normal=load("res://assets/SoundOnn.png")
	SoundButton2.texture_pressed=load("res://assets/SoundOfff.png")
	SoundButton2.toggle_mode=true
	SoundButton2.custom_minimum_size= Vector2(50.0,50.0)
	#end modif
	VolumeBox.add_child(SoundButton2)
	SoundButton2.owner = menu
	SoundButton2.toggled.connect(
	Callable(menu, "_on_sound_button_toggled"),
	Object.CONNECT_PERSIST
	)
	
	var VolumeLabel2 = Label.new()
	VolumeLabel2.name = "VolumeLabel"
	#modif done
	VolumeLabel2.text="Volume :"
	VolumeLabel2.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	VolumeLabel2.custom_minimum_size=Vector2(200.0,0.0)
	VolumeLabel2.add_theme_color_override("font_color", Color("#000000"))
	VolumeLabel2.add_theme_font_size_override("font_size", 30)
	#end modif
	VolumeBox.add_child(VolumeLabel2)
	VolumeLabel2.owner = menu
	
	var SoundSlider2 = HSlider.new()
	SoundSlider2.name = "SoundSlider"
	#modif done
	SoundSlider2.step=10.0
	SoundSlider2.value=100.0
	SoundSlider2.custom_minimum_size=Vector2(400.0,40.0)
	SoundSlider2.size_flags_vertical=Control.SIZE_SHRINK_CENTER
	#end modif
	VolumeBox.add_child( SoundSlider2)
	SoundSlider2.owner = menu
	SoundSlider2.value_changed.connect(
	Callable(menu, "_on_sound_slider_value_changed"),
	Object.CONNECT_PERSIST
	)
	
	var RightFill2 = Control.new()
	RightFill2.name = "RightFill"
	#modif done
	RightFill2.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	VolumeBox.add_child(RightFill2)
	RightFill2.owner = menu
	

# WindowBox
	
	var WindowBox = HBoxContainer.new()
	WindowBox.name = "WindowBox"
	#nada
	OptionsBox.add_child(WindowBox)
	WindowBox.owner = menu
	
	#childs de windowbox
	
	var LeftFill3 = Control.new()
	LeftFill3.name = "LeftFill" 
	#modif done
	LeftFill3.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	WindowBox.add_child(LeftFill3)
	LeftFill3.owner = menu
	
	var WindowButton3 = TextureButton.new()
	WindowButton3.name = "WindowButton"
	#modif done
	WindowButton3.ignore_texture_size=true
	WindowButton3.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	WindowButton3.texture_normal=load("res://assets/window2.png")
	WindowButton3.custom_minimum_size=Vector2(50.0,50.0)
	#end modif
	WindowBox.add_child(WindowButton3)
	WindowButton3.owner = menu
	
	var WindowLabel3 = Label.new()
	WindowLabel3.name = "WindowLabel"
	#modif done
	WindowLabel3.text="Window :"
	WindowLabel3.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	WindowLabel3.custom_minimum_size=Vector2(200.0,0.0)
	WindowLabel3.add_theme_color_override("font_color", Color("#000000"))
	WindowLabel3.add_theme_font_size_override("font_size", 30)
	#end modif
	WindowBox.add_child(WindowLabel3)
	WindowLabel3.owner = menu
	
	var Left3 = TextureButton.new()
	Left3.name = "Left"
	#modif done
	Left3.ignore_texture_size=true
	Left3.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Left3.texture_normal=load("res://assets/triangleLeft.png")
	Left3.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	WindowBox.add_child(Left3)
	Left3.owner = menu
	
	
	var WindowLabel23 = Label.new()
	
	Left3.pressed.connect(
	Callable(WindowLabel23, "_on_left_pressed"),
	Object.CONNECT_PERSIST
	)

	WindowLabel23.name = "WindowLabel2"
	#modif done
	WindowLabel23.text="windowed"
	WindowLabel23.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
	WindowLabel23.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	WindowLabel23.custom_minimum_size=Vector2(340.0,0.0)
	WindowLabel23.add_theme_color_override("font_color", Color("#000000"))
	WindowLabel23.add_theme_font_size_override("font_size", 30)
	#end modif
	WindowBox.add_child(WindowLabel23)
	WindowLabel23.owner = menu
	WindowLabel23.set_script(load("res://addons/yetanotherplugins/ScriptsScene/window_label_script.gd"))
	
	var Right3 = TextureButton.new()
	Right3.name = "Right"
	#modif done
	Right3.ignore_texture_size=true
	Right3.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Right3.texture_normal=load("res://assets/triangleRight.png")
	Right3.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	WindowBox.add_child(Right3)
	Right3.owner = menu
	Right3.pressed.connect(
	Callable(WindowLabel23, "_on_right_pressed"),
	Object.CONNECT_PERSIST
	)
	
	var RightFill3 = Control.new()
	RightFill3.name = "RightFill"
	#modif done
	RightFill3.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	WindowBox.add_child(RightFill3)
	RightFill3.owner = menu
	
# ResolutionBox

	var ResolutionBox = HBoxContainer.new()
	ResolutionBox.name = "ResolutionBox"
	#nada
	OptionsBox.add_child(ResolutionBox)
	ResolutionBox.owner = menu
	
	#childs de resolutionBox
	var LeftFill4 = Control.new()
	LeftFill4.name = "LeftFill"
	#modif done
	LeftFill4.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	ResolutionBox.add_child(LeftFill4)
	LeftFill4.owner = menu
	
	var ResolutionButton4 = TextureButton.new()
	ResolutionButton4.name = "ResolutionButton"
	#modif done
	ResolutionButton4.ignore_texture_size=true
	ResolutionButton4.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	ResolutionButton4.texture_normal=load("res://assets/screen.png")
	ResolutionButton4.custom_minimum_size=Vector2(50.0,50.0)
	#end modif
	ResolutionBox.add_child(ResolutionButton4)
	ResolutionButton4.owner = menu
	
	var ResolutionLabel4 = Label.new()
	ResolutionLabel4.name = "ResolutionLabel"
	#modif done
	ResolutionLabel4.text="Resolution :"
	ResolutionLabel4.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	ResolutionLabel4.custom_minimum_size=Vector2(200.0,0.0)
	ResolutionLabel4.add_theme_color_override("font_color", Color("#000000"))
	ResolutionLabel4.add_theme_font_size_override("font_size", 30)
	#end modif
	ResolutionBox.add_child(ResolutionLabel4)
	ResolutionLabel4.owner = menu
	
	var Left4 = TextureButton.new()
	Left4.name = "Left"
	#modif done
	Left4.ignore_texture_size=true
	Left4.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Left4.texture_normal=load("res://assets/triangleLeft.png")
	Left4.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	ResolutionBox.add_child(Left4)
	Left4.owner = menu
	
	var ResolutionLabel24 = Label.new()
	
	Left4.pressed.connect(
	Callable(ResolutionLabel24, "_on_left_pressed"),
	Object.CONNECT_PERSIST
	)
	
	ResolutionLabel24.name = "ResolutionLabel2"
	#modif done
	ResolutionLabel24.text="1920x1080"
	ResolutionLabel24.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
	ResolutionLabel24.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	ResolutionLabel24.custom_minimum_size=Vector2(340.0,0.0)
	ResolutionLabel24.add_theme_color_override("font_color", Color("#000000"))
	ResolutionLabel24.add_theme_font_size_override("font_size", 30)
	#end modif
	ResolutionBox.add_child(ResolutionLabel24)
	ResolutionLabel24.owner = menu
	ResolutionLabel24.set_script(load("res://addons/yetanotherplugins/ScriptsScene/resolution_label_script.gd"))
	
	var Right4 = TextureButton.new()
	Right4.name = "Right"
	#modif done
	Right4.ignore_texture_size=true
	Right4.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Right4.texture_normal=load("res://assets/triangleRight.png")
	Right4.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	ResolutionBox.add_child(Right4)
	Right4.owner = menu
	Right4.pressed.connect(
	Callable(ResolutionLabel24, "_on_right_pressed"),
	Object.CONNECT_PERSIST
	)
	
	var RightFill4 = Control.new()
	RightFill4.name = "RightFill"
	#modif done
	RightFill4.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	ResolutionBox.add_child(RightFill4)
	RightFill4.owner = menu
	
	
# VerticalSyncBox

	var VerticalSyncBox = HBoxContainer.new()
	VerticalSyncBox.name = "VerticalSyncBox"
	#nada
	OptionsBox.add_child(VerticalSyncBox)
	VerticalSyncBox.owner = menu
	
	#childs verticalSyncBox
	
	var LeftFill5 = Control.new()
	LeftFill5.name = "LeftFill"
	#modif done
	LeftFill5.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	VerticalSyncBox.add_child(LeftFill5)
	LeftFill5.owner = menu
	
	var VetSyncButton5 = TextureButton.new()
	VetSyncButton5.name = "VertSyncButton"
	#modif done
	VetSyncButton5.ignore_texture_size=true
	VetSyncButton5.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	VetSyncButton5.texture_normal=load("res://assets/vert.png")
	VetSyncButton5.custom_minimum_size=Vector2(50.0,50.0)
	#end modif
	VerticalSyncBox.add_child(VetSyncButton5)
	VetSyncButton5.owner = menu
	
	var VetSyncLabel5 = Label.new()
	VetSyncLabel5.name = "VertSyncLabel"
	#modif done
	VetSyncLabel5.text="Vertical Sync :"
	VetSyncLabel5.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	VetSyncLabel5.custom_minimum_size=Vector2(200.0,0.0)
	VetSyncLabel5.add_theme_color_override("font_color", Color("#000000"))
	VetSyncLabel5.add_theme_font_size_override("font_size", 30)
	#end modif
	VerticalSyncBox.add_child(VetSyncLabel5)
	VetSyncLabel5.owner = menu
	
	var Left5 = TextureButton.new()
	Left5.name = "Left"
	#modif done
	Left5.ignore_texture_size=true
	Left5.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Left5.texture_normal=load("res://assets/triangleLeft.png")
	Left5.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	VerticalSyncBox.add_child(Left5)
	Left5.owner = menu
	
	var VetSyncLabel25 = Label.new()
	
	Left5.pressed.connect(
	Callable(VetSyncLabel25, "_on_left_pressed"),
	Object.CONNECT_PERSIST
	)
	
	VetSyncLabel25.name = "VertSyncLabel2"
	#modif done
	VetSyncLabel25.text="on"
	VetSyncLabel25.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
	VetSyncLabel25.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
	VetSyncLabel25.custom_minimum_size=Vector2(340.0,0.0)
	VetSyncLabel25.add_theme_color_override("font_color", Color("#000000"))
	VetSyncLabel25.add_theme_font_size_override("font_size", 30)
	#end modif
	VerticalSyncBox.add_child(VetSyncLabel25)
	VetSyncLabel25.owner = menu
	VetSyncLabel25.set_script(load("res://addons/yetanotherplugins/ScriptsScene/vert_sync_label_script.gd"))
	
	var Right5 = TextureButton.new()
	Right5.name = "Right"
	#modif done
	Right5.ignore_texture_size=true
	Right5.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	Right5.texture_normal=load("res://assets/triangleRight.png")
	Right5.custom_minimum_size=Vector2(30.0,30.0)
	#end modif
	VerticalSyncBox.add_child(Right5)
	Right5.owner = menu
	Right5.pressed.connect(
	Callable(VetSyncLabel25, "_on_right_pressed"),
	Object.CONNECT_PERSIST
	)
	
	var RightFill5 = Control.new()
	RightFill5.name = "RightFill"
	#modif done
	RightFill5.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	VerticalSyncBox.add_child(RightFill5)
	RightFill5.owner = menu
	
# BackToMenuBox
	
	var BackToMenuBox = VBoxContainer.new()
	BackToMenuBox.name = "BackToMenuBox"
	#nada
	OptionsBox.add_child(BackToMenuBox)
	BackToMenuBox.owner = menu
	
	#childs de backtomenubox
	
	var Filler6 = Control.new()
	Filler6.name = "Filler"
	#modif done
	Filler6.custom_minimum_size=Vector2(0.0,30.0)
	#end modif
	BackToMenuBox.add_child( Filler6)
	Filler6.owner = menu
	
	var BackMenuUnderBox6 = HBoxContainer.new()
	BackMenuUnderBox6.name = "BackMenuUnderBox"
	#nada
	BackToMenuBox.add_child(BackMenuUnderBox6)
	BackMenuUnderBox6.owner = menu
	
	 #childs de backmenuunderbox6
	
	var LeftFill6 = Control.new()
	LeftFill6.name = "LeftFill"
	#modif done
	LeftFill6.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	BackMenuUnderBox6.add_child(LeftFill6)
	LeftFill6.owner = menu
	
	var Button6 = Button.new()
	Button6.name = "Button"
	#modif done
	Button6.text="Main menu"
	#end modif
	BackMenuUnderBox6.add_child(Button6)
	Button6.owner = menu
	Button6.pressed.connect(
	Callable(menu, "_load_scene"),
	Object.CONNECT_PERSIST
	)
	
	var RightFill6 = Control.new()
	RightFill6.name = "RightFill"
	#modif done
	RightFill6.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	BackMenuUnderBox6.add_child(RightFill6)
	RightFill6.owner = menu

# ResumeBox
	
	var ResumeBox = VBoxContainer.new()
	ResumeBox.name = "ResumeBox"
	#nada
	OptionsBox.add_child(ResumeBox)
	ResumeBox.owner = menu
	
	#childs de Resumebox
	
	var Filler7 = Control.new()
	Filler7.name = "Filler"
	#modif done
	Filler7.custom_minimum_size=Vector2(0.0,30.0)
	#end modif
	ResumeBox.add_child(Filler7)
	Filler7.owner = menu
	
	var ResumeUnderBox7 = HBoxContainer.new()
	ResumeUnderBox7.name = "ResumeUnderBox"
	#nada
	ResumeBox.add_child(ResumeUnderBox7)
	ResumeUnderBox7.owner = menu
	
		#child resumeunderbox7
	var LeftFill7 = Control.new()
	LeftFill7.name = "LeftFill"
	#modif done
	LeftFill7.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	ResumeUnderBox7.add_child(LeftFill7)
	LeftFill7.owner = menu
	
	var Button7 = Button.new()
	Button7.name = "Button"
	#modif done
	Button7.text="Resume"
	#end modif
	ResumeUnderBox7.add_child( Button7)
	Button7.owner = menu
	
	var RightFill7 = Control.new()
	RightFill7.name = "RightFill"
	#modif
	RightFill7.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	#end modif
	ResumeUnderBox7.add_child(RightFill7)
	RightFill7.owner = menu

	
	
	var scene = PackedScene.new()
	scene.pack(menu)
	var path = "res://menu.tscn"
	var err = ResourceSaver.save(scene, path)
	if err == OK:
		print("Scène générée :", path)
	else:
		push_error("Erreur sauvegarde scène")
