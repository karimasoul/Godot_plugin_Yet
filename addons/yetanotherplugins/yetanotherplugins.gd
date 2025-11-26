@tool
extends EditorPlugin

var dock_instance: Control

func _enter_tree():
	var dock_scene = preload("res://addons/yetanotherplugins/dock.tscn")
	dock_instance = dock_scene.instantiate()

	
	dock_instance.editor_interface = get_editor_interface()

	add_control_to_dock(DOCK_SLOT_RIGHT_BL, dock_instance)

func _exit_tree():
	if dock_instance:
		remove_control_from_docks(dock_instance)
		dock_instance = null
