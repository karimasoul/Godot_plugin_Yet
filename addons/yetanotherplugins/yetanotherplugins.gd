@tool
extends EditorPlugin

var dock_instance: Control

func _enter_tree():
	var dock_scene = preload("res://addons/yetanotherplugins/dock.tscn")
	dock_instance = dock_scene.instantiate()

	
	dock_instance.editor_interface = get_editor_interface()

	add_control_to_dock(DOCK_SLOT_RIGHT_BL, dock_instance)
	add_tool_menu_item("Generate menu", Callable(self, "_on_generate_main_menu"))

func _exit_tree():
	remove_tool_menu_item("Generate menu")
	if dock_instance:
		remove_control_from_docks(dock_instance)
		dock_instance = null


func _on_generate_main_menu() -> void:
	var generator_script = load("res://addons/yetanotherplugins/generator.gd")
	if generator_script:
		var generator = generator_script.new()
		add_child(generator)  
		generator.generate_main_menu()
		generator.queue_free() 
	else:
		push_error("Erreur chargement script générateur")
