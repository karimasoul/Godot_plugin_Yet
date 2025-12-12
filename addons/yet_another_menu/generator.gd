@tool
extends Node
## Generate the pause menu with only the options asked by the user
## The pause menu is made to fit the size of the viewport in your parameters


func generate_main_menu(is_visible_volume: bool = true, 
		is_visible_window: bool = true, is_visible_resolution: bool = true, 
		is_visible_vertical: bool = true, is_visible_title: bool = true, 
		is_visible_bmain: bool = true, is_visible_bresume: bool = true, 
		is_visible_exit: bool = true, scene_name: String = "", title_name: String = ""):
			
	var width_ref = ProjectSettings.get_setting("display/window/size/viewport_width")
	var menu = CanvasLayer.new()
	menu.name = "TestUIMain"
	menu.set_script(load("res://addons/yet_another_menu/ScriptsScene/menu_pause.gd"))

# background
	var background = TextureRect.new()
	background.name = "BG"
	background.texture = load("res://addons/yet_another_menu/assets/defaultBG.jpg")
	background.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	background.stretch_mode = TextureRect.STRETCH_SCALE
	background.set_anchors_preset(Control.PRESET_FULL_RECT)

	menu.add_child(background)
	background.owner = menu  

# hbox that holds everything
	var overall_box = HBoxContainer.new()
	overall_box.name = "OverallBox"
	overall_box.set_anchors_preset(Control.PRESET_FULL_RECT)
	menu.add_child(overall_box)
	overall_box.owner = menu

# Hbox content
	if is_visible_exit :
		var unpause_btn = TextureButton.new()
		unpause_btn.name = "UnpauseBtn"
		
		unpause_btn.ignore_texture_size = true
		unpause_btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		unpause_btn.texture_normal = load("res://addons/yet_another_menu/assets/cross.png")
		unpause_btn.custom_minimum_size = Vector2(0.045 * width_ref, 0.045 * width_ref)
		unpause_btn.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		overall_box.add_child(unpause_btn)
		unpause_btn.owner = menu
		unpause_btn.pressed.connect(
				Callable(menu, "_on_unpause_btn_pressed"), 
				Object.CONNECT_PERSIST)

# Vbox 
	var options_box = VBoxContainer.new()
	options_box.name = "OptionsBox"
	
	options_box.alignment = BoxContainer.ALIGNMENT_CENTER
	options_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	overall_box.add_child(options_box)
	options_box.owner = menu

# title_box
	if is_visible_title :
		var title_box = VBoxContainer.new()
		title_box.name = "TitleBox"
		options_box.add_child(title_box)
		title_box.owner = menu
		
		# Childs of title_box
		var title_under_box = HBoxContainer.new()
		title_under_box.name = "TitleUnderBox"
		title_box.add_child(title_under_box)
		title_under_box.owner = menu
		# Childs of titleunderbox
		var left_fill_title = Control.new()
		left_fill_title.name = "LeftFill"
		
		left_fill_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL  
		
		title_under_box.add_child(left_fill_title)
		left_fill_title.owner = menu
		
		var label_title = Label.new()
		label_title.name = "Label"
		
		if title_name == "" :
			title_name = "Title"
		label_title.text = title_name
		label_title.add_theme_font_size_override("font_size", 0.045 * width_ref)
		
		title_under_box.add_child(label_title)
		label_title.owner = menu
		
		var right_fill_title = Control.new()
		right_fill_title.name = "RightFill"
		
		right_fill_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
		
		title_under_box.add_child(right_fill_title)
		right_fill_title.owner = menu
		
		var filler = Control.new()
		filler.name = "Filler"
		
		filler.custom_minimum_size = Vector2(0.0, 0.015 * width_ref)
		
		title_box.add_child(filler)
		filler.owner = menu

# volume_box
	if is_visible_volume :
		var volume_box = HBoxContainer.new()
		volume_box.name = "VolumeBox"

		options_box.add_child(volume_box)
		volume_box.owner = menu
		
		# Childs de volume_box
		var left_fill_volume = Control.new()
		left_fill_volume.name = "LeftFill"
		
		left_fill_volume.size_flags_horizontal = Control.SIZE_EXPAND_FILL 
		
		volume_box.add_child(left_fill_volume)
		left_fill_volume.owner = menu
		
		var sound_btn = TextureButton.new()
		sound_btn.name = "SoundButton"
		
		sound_btn.ignore_texture_size = true
		sound_btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		sound_btn.texture_normal = load("res://addons/yet_another_menu/assets/SoundOn.png")
		sound_btn.texture_pressed = load("res://addons/yet_another_menu/assets/SoundOff.png")
		sound_btn.toggle_mode = true
		sound_btn.custom_minimum_size = Vector2(0.045 * width_ref, 0.045 * width_ref)
		
		volume_box.add_child(sound_btn)
		sound_btn.owner = menu
		sound_btn.toggled.connect(
				Callable(menu, "_on_sound_button_toggled"), 
				Object.CONNECT_PERSIST)
		
		var volume_label = Label.new()
		volume_label.name = "VolumeLabel"
		
		volume_label.text = "Volume :"
		volume_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		volume_label.custom_minimum_size = Vector2(0.2 * width_ref, 0.0)
		volume_label.add_theme_color_override("font_color", Color("#000000"))
		volume_label.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		volume_box.add_child(volume_label)
		volume_label.owner = menu
		
		var sound_slider = HSlider.new()
		sound_slider.name = "SoundSlider"
		
		sound_slider.step = 10.0
		sound_slider.value = 100.0
		sound_slider.custom_minimum_size = Vector2(0.36 * width_ref, 0.03 * width_ref)
		sound_slider.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		
		volume_box.add_child(sound_slider)
		sound_slider.owner = menu
		sound_slider.value_changed.connect(
				Callable(menu, "_on_sound_slider_value_changed"), 
				Object.CONNECT_PERSIST)
		
		var right_fill_volume = Control.new()
		right_fill_volume.name = "RightFill"
		
		right_fill_volume.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		volume_box.add_child(right_fill_volume)
		right_fill_volume.owner = menu

# window_box
	if is_visible_window :
		var window_box = HBoxContainer.new()
		window_box.name = "WindowBox"
		
		options_box.add_child(window_box)
		window_box.owner = menu
		
		# Childs de window_box
		
		var left_fill_window = Control.new()
		left_fill_window.name = "LeftFill" 
		
		left_fill_window.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		window_box.add_child(left_fill_window)
		left_fill_window.owner = menu
		
		var window_btn = TextureButton.new()
		window_btn.name = "WindowButton"
		
		window_btn.ignore_texture_size = true
		window_btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		window_btn.texture_normal = load("res://addons/yet_another_menu/assets/windowMode.png")
		window_btn.custom_minimum_size = Vector2(0.045 * width_ref, 0.045 * width_ref)
		
		window_box.add_child(window_btn)
		window_btn.owner = menu
		
		var window_label = Label.new()
		window_label.name = "WindowLabel"
		
		window_label.text = "Window :"
		window_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		window_label.custom_minimum_size = Vector2(0.2 * width_ref, 0.0)
		window_label.add_theme_color_override("font_color", Color("#000000"))
		window_label.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		window_box.add_child(window_label)
		window_label.owner = menu
		
		var left_volume = TextureButton.new()
		left_volume.name = "Left"
		
		left_volume.ignore_texture_size = true
		left_volume.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		left_volume.texture_normal = load("res://addons/yet_another_menu/assets/triangleLeft.png")
		left_volume.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		window_box.add_child(left_volume)
		left_volume.owner = menu
		
		
		var window_label_2 = Label.new()
		
		left_volume.pressed.connect(
				Callable(window_label_2, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)

		window_label_2.name = "WindowLabel2"
		
		window_label_2.text = "windowed"
		window_label_2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		window_label_2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		window_label_2.custom_minimum_size = Vector2(0.3 * width_ref, 0.0)
		window_label_2.add_theme_color_override("font_color", Color("#000000"))
		window_label_2.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		window_box.add_child(window_label_2)
		window_label_2.owner = menu
		window_label_2.set_script(load(
				"res://addons/yet_another_menu/ScriptsScene/window_label_script.gd"))
		
		var right_volume = TextureButton.new()
		right_volume.name = "Right"
		
		right_volume.ignore_texture_size = true
		right_volume.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		right_volume.texture_normal = load("res://addons/yet_another_menu/assets/triangleRight.png")
		right_volume.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		window_box.add_child(right_volume)
		right_volume.owner = menu
		right_volume.pressed.connect(
				Callable(window_label_2, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var right_fill_volume = Control.new()
		right_fill_volume.name = "RightFill"
		
		right_fill_volume.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		window_box.add_child(right_fill_volume)
		right_fill_volume.owner = menu

# resolution_box
	if is_visible_resolution :
		var resolution_box = HBoxContainer.new()
		resolution_box.name = "resolution_box"

		options_box.add_child(resolution_box)
		resolution_box.owner = menu
		
		# Childs of resolution_box
		var left_fill_resolution = Control.new()
		left_fill_resolution.name = "LeftFill"
		
		left_fill_resolution.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		resolution_box.add_child(left_fill_resolution)
		left_fill_resolution.owner = menu
		
		var resolution_btn = TextureButton.new()
		resolution_btn.name = "ResolutionButton"
		
		resolution_btn.ignore_texture_size = true
		resolution_btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		resolution_btn.texture_normal = load(
				"res://addons/yet_another_menu/assets/WindowRes.png")
		resolution_btn.custom_minimum_size = Vector2(0.045 * width_ref, 0.045 * width_ref)
		
		resolution_box.add_child(resolution_btn)
		resolution_btn.owner = menu
		
		var resolution_label = Label.new()
		resolution_label.name = "ResolutionLabel"
		
		resolution_label.text = "Resolution :"
		resolution_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		resolution_label.custom_minimum_size = Vector2(0.2 * width_ref, 0.0)
		resolution_label.add_theme_color_override("font_color", Color("#000000"))
		resolution_label.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		resolution_box.add_child(resolution_label)
		resolution_label.owner = menu
		
		var left_resolution = TextureButton.new()
		left_resolution.name = "Left"
		
		left_resolution.ignore_texture_size = true
		left_resolution.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		left_resolution.texture_normal = load("res://addons/yet_another_menu/assets/triangleLeft.png")
		left_resolution.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		resolution_box.add_child(left_resolution)
		left_resolution.owner = menu
		
		var resolution_label_2 = Label.new()
		
		left_resolution.pressed.connect(
				Callable(resolution_label_2, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)
		
		resolution_label_2.name = "ResolutionLabel2"
		
		resolution_label_2.text = "1920x1080"
		resolution_label_2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		resolution_label_2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		resolution_label_2.custom_minimum_size = Vector2(0.3 * width_ref, 0.0)
		resolution_label_2.add_theme_color_override("font_color", Color("#000000"))
		resolution_label_2.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		resolution_box.add_child(resolution_label_2)
		resolution_label_2.owner = menu
		resolution_label_2.set_script(load(
				"res://addons/yet_another_menu/ScriptsScene/resolution_label_script.gd"))
		
		var right_resolution = TextureButton.new()
		right_resolution.name = "Right"
		
		right_resolution.ignore_texture_size = true
		right_resolution.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		right_resolution.texture_normal = load("res://addons/yet_another_menu/assets/triangleRight.png")
		right_resolution.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		resolution_box.add_child(right_resolution)
		right_resolution.owner = menu
		right_resolution.pressed.connect(
				Callable(resolution_label_2, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var right_fill_resolution = Control.new()
		right_fill_resolution.name = "RightFill"
		
		right_fill_resolution.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		resolution_box.add_child(right_fill_resolution)
		right_fill_resolution.owner = menu
		

# vertical_sync_box
	if is_visible_vertical :
		var vertical_sync_box = HBoxContainer.new()
		vertical_sync_box.name = "VerticalSyncBox"
		
		options_box.add_child(vertical_sync_box)
		vertical_sync_box.owner = menu
		
		# Childs of vertical_sync_box
		
		var left_fill_vert_sync = Control.new()
		left_fill_vert_sync.name = "LeftFill"
		
		left_fill_vert_sync.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		vertical_sync_box.add_child(left_fill_vert_sync)
		left_fill_vert_sync.owner = menu
		
		var vertical_sync_btn = TextureButton.new()
		vertical_sync_btn.name = "VertSyncButton"
		
		vertical_sync_btn.ignore_texture_size = true
		vertical_sync_btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		vertical_sync_btn.texture_normal = load("res://addons/yet_another_menu/assets/vertSync.png")
		vertical_sync_btn.custom_minimum_size = Vector2(0.045 * width_ref, 0.045 * width_ref)
		
		vertical_sync_box.add_child(vertical_sync_btn)
		vertical_sync_btn.owner = menu
		
		var vertical_sync_label = Label.new()
		vertical_sync_label.name = "VertSyncLabel"
		
		vertical_sync_label.text = "Vertical Sync :"
		vertical_sync_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		vertical_sync_label.custom_minimum_size = Vector2(0.2 * width_ref, 0.0)
		vertical_sync_label.add_theme_color_override("font_color", Color("#000000"))
		vertical_sync_label.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		vertical_sync_box.add_child(vertical_sync_label)
		vertical_sync_label.owner = menu
		
		var left_vertical_sync = TextureButton.new()
		left_vertical_sync.name = "Left"
		
		left_vertical_sync.ignore_texture_size = true
		left_vertical_sync.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		left_vertical_sync.texture_normal = load("res://addons/yet_another_menu/assets/triangleLeft.png")
		left_vertical_sync.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		vertical_sync_box.add_child(left_vertical_sync)
		left_vertical_sync.owner = menu
		
		var vertical_sync_label_2 = Label.new()
		
		left_vertical_sync.pressed.connect(
				Callable(vertical_sync_label_2, "_on_left_pressed"), 
				Object.CONNECT_PERSIST)
		
		vertical_sync_label_2.name = "VertSyncLabel2"
		
		vertical_sync_label_2.text = "on"
		vertical_sync_label_2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vertical_sync_label_2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		vertical_sync_label_2.custom_minimum_size = Vector2(0.3 * width_ref, 0.0)
		vertical_sync_label_2.add_theme_color_override("font_color", Color("#000000"))
		vertical_sync_label_2.add_theme_font_size_override("font_size", 0.03 * width_ref)
		
		vertical_sync_box.add_child(vertical_sync_label_2)
		vertical_sync_label_2.owner = menu
		vertical_sync_label_2.set_script(load(
				"res://addons/yet_another_menu/ScriptsScene/vert_sync_label_script.gd"))
		
		var right_vertical_sync = TextureButton.new()
		right_vertical_sync.name = "Right"
		
		right_vertical_sync.ignore_texture_size = true
		right_vertical_sync.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		right_vertical_sync.texture_normal = load("res://addons/yet_another_menu/assets/triangleRight.png")
		right_vertical_sync.custom_minimum_size = Vector2(0.03 * width_ref, 0.03 * width_ref)
		
		vertical_sync_box.add_child(right_vertical_sync)
		right_vertical_sync.owner = menu
		right_vertical_sync.pressed.connect(
				Callable(vertical_sync_label_2, "_on_right_pressed"), 
				Object.CONNECT_PERSIST)
		
		var right_fill_vertical_sync = Control.new()
		right_fill_vertical_sync.name = "RightFill"
		
		right_fill_vertical_sync.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		vertical_sync_box.add_child(right_fill_vertical_sync)
		right_fill_vertical_sync.owner = menu

# back_to_menu_box
	if is_visible_bmain :
		var back_to_menu_box = VBoxContainer.new()
		back_to_menu_box.name = "BackToMenuBox"
		
		options_box.add_child(back_to_menu_box)
		back_to_menu_box.owner = menu
		
		# Childs of back_to_menu_box
		
		var filler_back_to_menu = Control.new()
		filler_back_to_menu.name = "filler"
		
		filler_back_to_menu.custom_minimum_size = Vector2(0.0, 0.015 * width_ref)
		
		back_to_menu_box.add_child(filler_back_to_menu)
		filler_back_to_menu.owner = menu
		
		var back_menu_under_box = HBoxContainer.new()
		back_menu_under_box.name = "BackMenuUnderBox"
		back_to_menu_box.add_child(back_menu_under_box)
		back_menu_under_box.owner = menu
		
		
		 # Childs of back_menu_under_box
		
		var left_fill_back_to_menu = Control.new()
		left_fill_back_to_menu.name = "LeftFill"
		
		left_fill_back_to_menu.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		back_menu_under_box.add_child(left_fill_back_to_menu)
		left_fill_back_to_menu.owner = menu
		
		var back_to_menu_btn = Button.new()
		back_to_menu_btn.name = "Button"
		
		back_to_menu_btn.text = "Main menu"
		
		back_menu_under_box.add_child(back_to_menu_btn)
		back_to_menu_btn.owner = menu
		back_to_menu_btn.pressed.connect(
				Callable(menu, "_load_scene"), 
				Object.CONNECT_PERSIST)
		back_to_menu_btn.add_theme_font_size_override("font_size", 0.02 * width_ref)
		
		var right_fill_back_to_menu = Control.new()
		right_fill_back_to_menu.name = "RightFill"
		
		right_fill_back_to_menu.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		back_menu_under_box.add_child(right_fill_back_to_menu)
		right_fill_back_to_menu.owner = menu

# resume_box
	if is_visible_bresume :
		var resume_box = VBoxContainer.new()
		resume_box.name = "ResumeBox"
		options_box.add_child(resume_box)
		resume_box.owner = menu
		
		# Childs of resume_box
		
		var filler_resume = Control.new()
		filler_resume.name = "filler"
		
		filler_resume.custom_minimum_size = Vector2(0.0, 0.015 * width_ref)
		
		resume_box.add_child(filler_resume)
		filler_resume.owner = menu
		
		var resume_under_box = HBoxContainer.new()
		resume_under_box.name = "ResumeUnderBox"
		resume_box.add_child(resume_under_box)
		resume_under_box.owner = menu
		
		# Child of resume_under_box
		var left_fill_resume = Control.new()
		left_fill_resume.name = "LeftFill"
		
		left_fill_resume.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		resume_under_box.add_child(left_fill_resume)
		left_fill_resume.owner = menu
		
		var resume_btn = Button.new()
		resume_btn.name = "Button"
		
		resume_btn.text = "Resume"
		
		resume_under_box.add_child(resume_btn)
		resume_btn.owner = menu
		resume_btn.pressed.connect(
				Callable(menu, "_on_unpause_btn_pressed"), 
				Object.CONNECT_PERSIST)
		resume_btn.add_theme_font_size_override("font_size", 0.02 * width_ref)
		
		var right_fill_resume = Control.new()
		right_fill_resume.name = "RightFill"
		right_fill_resume.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		resume_under_box.add_child(right_fill_resume)
		right_fill_resume.owner = menu

	var scene = PackedScene.new()
	scene.pack(menu)
	# Allows the user to create multiple pause menu
	if scene_name ==  "" :
		scene_name = "pause_menu"
	var path = "res://" + scene_name + ".tscn"
	var err = ResourceSaver.save(scene, path)
	if err ==  OK:
		print("Scène générée :", path)
	else:
		push_error("Erreur sauvegarde scène")
