@tool
extends Node
## Generate the pause menu with only the options asked by the user


func generate_main_menu(is_visible_volume: bool = true, 
		is_visible_window: bool = true, is_visible_resolution: bool = true, 
		is_visible_vertical: bool = true, is_visible_title: bool = true, 
		is_visible_bmain: bool = true, is_visible_bresume: bool = true, 
		is_visible_exit: bool = true, scene_name: String = "", title_name: String = ""):
	var menu = Control.new()
	menu.name = "TestUIMain"
	menu.size = Vector2(1152.0, 648.0)
	menu.set_script(load("res://addons/yetanotherplugins/ScriptsScene/menu_pause.gd"))

# background
	var fond = TextureRect.new()
	fond.name = "BG"
	fond.texture = load("res://addons/yetanotherplugins/assets/defaultBG.jpg")
	fond.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	fond.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED

	fond.size = Vector2(1152.0, 648.0)
	fond.modulate = "#ffffff78"
	menu.add_child(fond)
	fond.owner = menu  

# hbox that holds everything
	var OverallBox = HBoxContainer.new()
	OverallBox.name = "OverallBox"
	OverallBox.size = Vector2(1152.0, 648.0)
	menu.add_child(OverallBox)
	OverallBox.owner = menu

# Hbox content
	if is_visible_exit :
		var UnpauseBtn = TextureButton.new()
		UnpauseBtn.name = "UnpauseBtn"
		
		UnpauseBtn.ignore_texture_size = true
		UnpauseBtn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		UnpauseBtn.texture_normal = load("res://addons/yetanotherplugins/assets/cross.png")
		UnpauseBtn.custom_minimum_size =  Vector2(50.0, 50.0)
		UnpauseBtn.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		OverallBox.add_child(UnpauseBtn)
		UnpauseBtn.owner = menu
		UnpauseBtn.pressed.connect(
				Callable(menu, "_on_unpause_btn_pressed"), 
				Object.CONNECT_PERSIST)

# Vbox 
	var OptionsBox = VBoxContainer.new()
	OptionsBox.name = "OptionsBox"
	
	OptionsBox.alignment = BoxContainer.ALIGNMENT_CENTER
	OptionsBox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	OverallBox.add_child(OptionsBox)
	OptionsBox.owner = menu

# TitleBox
	if is_visible_title :
		var TitleBox = VBoxContainer.new()
		TitleBox.name = "TitleBox"
		OptionsBox.add_child(TitleBox)
		TitleBox.owner = menu
		
		# Childs of Titlebox
		var TitleUnderBox1 = HBoxContainer.new()
		TitleUnderBox1.name = "TitleUnderBox"
		TitleBox.add_child(TitleUnderBox1)
		TitleUnderBox1.owner = menu
		# Childs of titleunderbox
		var LeftFill1 = Control.new()
		LeftFill1.name = "LeftFill"
		
		LeftFill1.size_flags_horizontal = Control.SIZE_EXPAND_FILL  
		
		TitleUnderBox1.add_child(LeftFill1)
		LeftFill1.owner = menu
		
		var Label1 = Label.new()
		Label1.name = "Label"
		
		if title_name == "" :
			title_name = "Title"
		Label1.text = title_name
		Label1.add_theme_font_size_override("font_size", 50)
		
		TitleUnderBox1.add_child(Label1)
		Label1.owner = menu
		
		var RightFill1 = Control.new()
		RightFill1.name = "RightFill"
		
		RightFill1.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
		
		TitleUnderBox1.add_child(RightFill1)
		RightFill1.owner = menu
		
		var Filler = Control.new()
		Filler.name = "Filler"
		
		Filler.custom_minimum_size = Vector2(0.0, 50.0)
		
		TitleBox.add_child(Filler)
		Filler.owner = menu

# VolumeBox
	if is_visible_volume :
		var VolumeBox = HBoxContainer.new()
		VolumeBox.name = "VolumeBox"

		OptionsBox.add_child(VolumeBox)
		VolumeBox.owner = menu
		
		# Childs de volumebox
		var LeftFill2 = Control.new()
		LeftFill2.name = "LeftFill"
		
		LeftFill2.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
		
		VolumeBox.add_child(LeftFill2)
		LeftFill2.owner = menu
		
		var SoundButton2 = TextureButton.new()
		SoundButton2.name = "SoundButton"
		
		SoundButton2.ignore_texture_size = true
		SoundButton2.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		SoundButton2.texture_normal = load("res://addons/yetanotherplugins/assets/SoundOn.png")
		SoundButton2.texture_pressed = load("res://addons/yetanotherplugins/assets/SoundOff.png")
		SoundButton2.toggle_mode = true
		SoundButton2.custom_minimum_size = Vector2(50.0, 50.0)
		
		VolumeBox.add_child(SoundButton2)
		SoundButton2.owner = menu
		SoundButton2.toggled.connect(
				Callable(menu, "_on_sound_button_toggled"), 
				Object.CONNECT_PERSIST)
		
		var VolumeLabel2 = Label.new()
		VolumeLabel2.name = "VolumeLabel"
		
		VolumeLabel2.text = "Volume :"
		VolumeLabel2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		VolumeLabel2.custom_minimum_size = Vector2(200.0, 0.0)
		VolumeLabel2.add_theme_color_override("font_color", Color("#000000"))
		VolumeLabel2.add_theme_font_size_override("font_size", 30)
		
		VolumeBox.add_child(VolumeLabel2)
		VolumeLabel2.owner = menu
		
		var SoundSlider2 = HSlider.new()
		SoundSlider2.name = "SoundSlider"
		
		SoundSlider2.step = 10.0
		SoundSlider2.value = 100.0
		SoundSlider2.custom_minimum_size = Vector2(400.0, 40.0)
		SoundSlider2.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		
		VolumeBox.add_child( SoundSlider2)
		SoundSlider2.owner = menu
		SoundSlider2.value_changed.connect(
				Callable(menu, "_on_sound_slider_value_changed"), 
				Object.CONNECT_PERSIST)
		
		var RightFill2 = Control.new()
		RightFill2.name = "RightFill"
		
		RightFill2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		VolumeBox.add_child(RightFill2)
		RightFill2.owner = menu

# WindowBox
	if is_visible_window :
		var WindowBox = HBoxContainer.new()
		WindowBox.name = "WindowBox"
		
		OptionsBox.add_child(WindowBox)
		WindowBox.owner = menu
		
		# Childs de windowbox
		
		var LeftFill3 = Control.new()
		LeftFill3.name = "LeftFill" 
		
		LeftFill3.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		WindowBox.add_child(LeftFill3)
		LeftFill3.owner = menu
		
		var WindowButton3 = TextureButton.new()
		WindowButton3.name = "WindowButton"
		
		WindowButton3.ignore_texture_size = true
		WindowButton3.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		WindowButton3.texture_normal = load("res://addons/yetanotherplugins/assets/windowMode.png")
		WindowButton3.custom_minimum_size = Vector2(50.0, 50.0)
		
		WindowBox.add_child(WindowButton3)
		WindowButton3.owner = menu
		
		var WindowLabel3 = Label.new()
		WindowLabel3.name = "WindowLabel"
		
		WindowLabel3.text = "Window :"
		WindowLabel3.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		WindowLabel3.custom_minimum_size = Vector2(200.0, 0.0)
		WindowLabel3.add_theme_color_override("font_color", Color("#000000"))
		WindowLabel3.add_theme_font_size_override("font_size", 30)
		
		WindowBox.add_child(WindowLabel3)
		WindowLabel3.owner = menu
		
		var Left3 = TextureButton.new()
		Left3.name = "Left"
		
		Left3.ignore_texture_size = true
		Left3.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Left3.texture_normal = load("res://addons/yetanotherplugins/assets/triangleLeft.png")
		Left3.custom_minimum_size = Vector2(30.0, 30.0)
		
		WindowBox.add_child(Left3)
		Left3.owner = menu
		
		
		var WindowLabel23 = Label.new()
		
		Left3.pressed.connect(
				Callable(WindowLabel23, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)

		WindowLabel23.name = "WindowLabel2"
		
		WindowLabel23.text = "windowed"
		WindowLabel23.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		WindowLabel23.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		WindowLabel23.custom_minimum_size = Vector2(340.0, 0.0)
		WindowLabel23.add_theme_color_override("font_color", Color("#000000"))
		WindowLabel23.add_theme_font_size_override("font_size", 30)
		
		WindowBox.add_child(WindowLabel23)
		WindowLabel23.owner = menu
		WindowLabel23.set_script(load(
				"res://addons/yetanotherplugins/ScriptsScene/window_label_script.gd"))
		
		var Right3 = TextureButton.new()
		Right3.name = "Right"
		
		Right3.ignore_texture_size = true
		Right3.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Right3.texture_normal = load("res://addons/yetanotherplugins/assets/triangleRight.png")
		Right3.custom_minimum_size = Vector2(30.0, 30.0)
		
		WindowBox.add_child(Right3)
		Right3.owner = menu
		Right3.pressed.connect(
				Callable(WindowLabel23, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var RightFill3 = Control.new()
		RightFill3.name = "RightFill"
		
		RightFill3.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		WindowBox.add_child(RightFill3)
		RightFill3.owner = menu

# ResolutionBox
	if is_visible_resolution :
		var ResolutionBox = HBoxContainer.new()
		ResolutionBox.name = "ResolutionBox"

		OptionsBox.add_child(ResolutionBox)
		ResolutionBox.owner = menu
		
		# Childs of resolutionBox
		var LeftFill4 = Control.new()
		LeftFill4.name = "LeftFill"
		
		LeftFill4.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		ResolutionBox.add_child(LeftFill4)
		LeftFill4.owner = menu
		
		var ResolutionButton4 = TextureButton.new()
		ResolutionButton4.name = "ResolutionButton"
		
		ResolutionButton4.ignore_texture_size = true
		ResolutionButton4.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		ResolutionButton4.texture_normal = load(
				"res://addons/yetanotherplugins/assets/WindowRes.png")
		ResolutionButton4.custom_minimum_size = Vector2(50.0, 50.0)
		
		ResolutionBox.add_child(ResolutionButton4)
		ResolutionButton4.owner = menu
		
		var ResolutionLabel4 = Label.new()
		ResolutionLabel4.name = "ResolutionLabel"
		
		ResolutionLabel4.text = "Resolution :"
		ResolutionLabel4.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		ResolutionLabel4.custom_minimum_size = Vector2(200.0, 0.0)
		ResolutionLabel4.add_theme_color_override("font_color", Color("#000000"))
		ResolutionLabel4.add_theme_font_size_override("font_size", 30)
		
		ResolutionBox.add_child(ResolutionLabel4)
		ResolutionLabel4.owner = menu
		
		var Left4 = TextureButton.new()
		Left4.name = "Left"
		
		Left4.ignore_texture_size = true
		Left4.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Left4.texture_normal = load("res://addons/yetanotherplugins/assets/triangleLeft.png")
		Left4.custom_minimum_size = Vector2(30.0, 30.0)
		
		ResolutionBox.add_child(Left4)
		Left4.owner = menu
		
		var ResolutionLabel24 = Label.new()
		
		Left4.pressed.connect(
				Callable(ResolutionLabel24, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)
		
		ResolutionLabel24.name = "ResolutionLabel2"
		
		ResolutionLabel24.text = "1920x1080"
		ResolutionLabel24.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ResolutionLabel24.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		ResolutionLabel24.custom_minimum_size = Vector2(340.0, 0.0)
		ResolutionLabel24.add_theme_color_override("font_color", Color("#000000"))
		ResolutionLabel24.add_theme_font_size_override("font_size", 30)
		
		ResolutionBox.add_child(ResolutionLabel24)
		ResolutionLabel24.owner = menu
		ResolutionLabel24.set_script(load(
				"res://addons/yetanotherplugins/ScriptsScene/resolution_label_script.gd"))
		
		var Right4 = TextureButton.new()
		Right4.name = "Right"
		
		Right4.ignore_texture_size = true
		Right4.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Right4.texture_normal = load("res://addons/yetanotherplugins/assets/triangleRight.png")
		Right4.custom_minimum_size = Vector2(30.0, 30.0)
		
		ResolutionBox.add_child(Right4)
		Right4.owner = menu
		Right4.pressed.connect(
				Callable(ResolutionLabel24, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var RightFill4 = Control.new()
		RightFill4.name = "RightFill"
		
		RightFill4.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		ResolutionBox.add_child(RightFill4)
		RightFill4.owner = menu
		

# VerticalSyncBox
	if is_visible_vertical :
		var VerticalSyncBox = HBoxContainer.new()
		VerticalSyncBox.name = "VerticalSyncBox"
		
		OptionsBox.add_child(VerticalSyncBox)
		VerticalSyncBox.owner = menu
		
		# Childs of verticalSyncBox
		
		var LeftFill5 = Control.new()
		LeftFill5.name = "LeftFill"
		
		LeftFill5.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		VerticalSyncBox.add_child(LeftFill5)
		LeftFill5.owner = menu
		
		var VetSyncButton5 = TextureButton.new()
		VetSyncButton5.name = "VertSyncButton"
		
		VetSyncButton5.ignore_texture_size = true
		VetSyncButton5.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		VetSyncButton5.texture_normal = load("res://addons/yetanotherplugins/assets/vertSync.png")
		VetSyncButton5.custom_minimum_size = Vector2(50.0, 50.0)
		
		VerticalSyncBox.add_child(VetSyncButton5)
		VetSyncButton5.owner = menu
		
		var VetSyncLabel5 = Label.new()
		VetSyncLabel5.name = "VertSyncLabel"
		
		VetSyncLabel5.text = "Vertical Sync :"
		VetSyncLabel5.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		VetSyncLabel5.custom_minimum_size = Vector2(200.0, 0.0)
		VetSyncLabel5.add_theme_color_override("font_color", Color("#000000"))
		VetSyncLabel5.add_theme_font_size_override("font_size", 30)
		
		VerticalSyncBox.add_child(VetSyncLabel5)
		VetSyncLabel5.owner = menu
		
		var Left5 = TextureButton.new()
		Left5.name = "Left"
		
		Left5.ignore_texture_size = true
		Left5.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Left5.texture_normal = load("res://addons/yetanotherplugins/assets/triangleLeft.png")
		Left5.custom_minimum_size = Vector2(30.0, 30.0)
		
		VerticalSyncBox.add_child(Left5)
		Left5.owner = menu
		
		var VetSyncLabel25 = Label.new()
		
		Left5.pressed.connect(
				Callable(VetSyncLabel25, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)
		
		VetSyncLabel25.name = "VertSyncLabel2"
		
		VetSyncLabel25.text = "on"
		VetSyncLabel25.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		VetSyncLabel25.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		VetSyncLabel25.custom_minimum_size = Vector2(340.0, 0.0)
		VetSyncLabel25.add_theme_color_override("font_color", Color("#000000"))
		VetSyncLabel25.add_theme_font_size_override("font_size", 30)
		
		VerticalSyncBox.add_child(VetSyncLabel25)
		VetSyncLabel25.owner = menu
		VetSyncLabel25.set_script(load(
				"res://addons/yetanotherplugins/ScriptsScene/vert_sync_label_script.gd"))
		
		var Right5 = TextureButton.new()
		Right5.name = "Right"
		
		Right5.ignore_texture_size = true
		Right5.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		Right5.texture_normal = load("res://addons/yetanotherplugins/assets/triangleRight.png")
		Right5.custom_minimum_size = Vector2(30.0, 30.0)
		
		VerticalSyncBox.add_child(Right5)
		Right5.owner = menu
		Right5.pressed.connect(
				Callable(VetSyncLabel25, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var RightFill5 = Control.new()
		RightFill5.name = "RightFill"
		
		RightFill5.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		VerticalSyncBox.add_child(RightFill5)
		RightFill5.owner = menu

# BackToMenuBox
	if is_visible_bmain :
		var BackToMenuBox = VBoxContainer.new()
		BackToMenuBox.name = "BackToMenuBox"
		
		OptionsBox.add_child(BackToMenuBox)
		BackToMenuBox.owner = menu
		
		# Childs of backtomenubox
		
		var Filler6 = Control.new()
		Filler6.name = "Filler"
		
		Filler6.custom_minimum_size = Vector2(0.0, 30.0)
		
		BackToMenuBox.add_child( Filler6)
		Filler6.owner = menu
		
		var BackMenuUnderBox6 = HBoxContainer.new()
		BackMenuUnderBox6.name = "BackMenuUnderBox"
		BackToMenuBox.add_child(BackMenuUnderBox6)
		BackMenuUnderBox6.owner = menu
		
		 # Childs of backmenuunderbox6
		
		var LeftFill6 = Control.new()
		LeftFill6.name = "LeftFill"
		
		LeftFill6.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		BackMenuUnderBox6.add_child(LeftFill6)
		LeftFill6.owner = menu
		
		var Button6 = Button.new()
		Button6.name = "Button"
		
		Button6.text = "Main menu"
		
		BackMenuUnderBox6.add_child(Button6)
		Button6.owner = menu
		Button6.pressed.connect(
				Callable(menu, "_load_scene"), 
				Object.CONNECT_PERSIST)
		
		var RightFill6 = Control.new()
		RightFill6.name = "RightFill"
		
		RightFill6.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		BackMenuUnderBox6.add_child(RightFill6)
		RightFill6.owner = menu

# ResumeBox
	if is_visible_bresume :
		var ResumeBox = VBoxContainer.new()
		ResumeBox.name = "ResumeBox"
		OptionsBox.add_child(ResumeBox)
		ResumeBox.owner = menu
		
		# Childs of Resumebox
		
		var Filler7 = Control.new()
		Filler7.name = "Filler"
		
		Filler7.custom_minimum_size = Vector2(0.0, 30.0)
		
		ResumeBox.add_child(Filler7)
		Filler7.owner = menu
		
		var ResumeUnderBox = HBoxContainer.new()
		ResumeUnderBox.name = "ResumeUnderBox"
		ResumeBox.add_child(ResumeUnderBox)
		ResumeUnderBox.owner = menu
		
		# Child of resumeunderbox
		var LeftFill7 = Control.new()
		LeftFill7.name = "LeftFill"
		
		LeftFill7.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		ResumeUnderBox.add_child(LeftFill7)
		LeftFill7.owner = menu
		
		var Button7 = Button.new()
		Button7.name = "Button"
		
		Button7.text = "Resume"
		
		ResumeUnderBox.add_child(Button7)
		Button7.owner = menu
		Button7.pressed.connect(
				Callable(menu, "_on_unpause_btn_pressed"), 
				Object.CONNECT_PERSIST)
		
		var RightFill7 = Control.new()
		RightFill7.name = "RightFill"
		RightFill7.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		ResumeUnderBox.add_child(RightFill7)
		RightFill7.owner = menu

	var scene = PackedScene.new()
	scene.pack(menu)
	# Allows the user to create multiple pause menu
	if scene_name ==  "" :
		scene_name = "menu"
	var path = "res://" + scene_name + ".tscn"
	var err = ResourceSaver.save(scene, path)
	if err ==  OK:
		print("Scène générée :", path)
	else:
		push_error("Erreur sauvegarde scène")
