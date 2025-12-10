@tool
extends EditorPlugin

var dock_instance: Control
var btn_generate: Button
@onready var hide_volume: CheckBox
@onready var hide_window: CheckBox
@onready var hide_resolution: CheckBox
@onready var hide_vertical: CheckBox

@onready var hide_title: CheckBox
@onready var hide_bmain: CheckBox
@onready var hide_bresume: CheckBox
@onready var hide_exit: CheckBox

func _enter_tree():
	var dock_scene = preload("res://addons/yetanotherplugins/dock.tscn")
	dock_instance = dock_scene.instantiate()

	
	#dock_instance.editor_interface = get_editor_interface()

	add_control_to_dock(DOCK_SLOT_RIGHT_BL, dock_instance)
	#add_tool_menu_item("Generate menu", Callable(self, "_on_generate_main_menu"))
	#hide_volume=CheckBox.new()
	#hide_volume.text = "Show VolumeBox"
	#dock_instance.add_child(hide_volume)
	hide_volume = dock_instance.get_node("VBoxContainer/CheckBox")
	hide_window = dock_instance.get_node("VBoxContainer2/CheckBox")
	hide_resolution = dock_instance.get_node("VBoxContainer3/CheckBox")
	hide_vertical = dock_instance.get_node("VBoxContainer4/CheckBox")
	
	hide_title = dock_instance.get_node("VBoxContainer5/CheckBox")
	hide_bmain = dock_instance.get_node("VBoxContainer6/CheckBox")
	hide_bresume = dock_instance.get_node("VBoxContainer7/CheckBox")
	hide_exit = dock_instance.get_node("VBoxContainer8/CheckBox")
	
	

	
	btn_generate = Button.new()
	btn_generate.text="Gnerate Menu"
	btn_generate.size=Vector2(129.0,31.0)
	btn_generate.position=Vector2(0.0,175.0)
	dock_instance.add_child(btn_generate)
	btn_generate.pressed.connect(Callable(self,"_on_generate_main_menu"))


	# Connexion du signal


func _exit_tree():
	remove_tool_menu_item("Generate menu")
	if dock_instance and dock_instance.is_inside_tree():
		remove_control_from_docks(dock_instance)
		dock_instance.queue_free()
		dock_instance = null


func _on_generate_main_menu() -> void:
	var generator_script = load("res://addons/yetanotherplugins/generator.gd")
	
	if generator_script:
		var generator = generator_script.new()
		add_child(generator)  
		#generator.flag_volume = hide_volume.pressed
		generator.generate_main_menu(hide_volume.button_pressed, hide_window.button_pressed, hide_resolution.button_pressed, hide_vertical.button_pressed, hide_title.button_pressed, hide_bmain.button_pressed, hide_bresume.button_pressed, hide_exit.button_pressed )
		generator.queue_free() 
	else:
		push_error("Erreur chargement script générateur")
