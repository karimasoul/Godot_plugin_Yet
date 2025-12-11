#extends TextureButton
#
## référence au dock
#var dock: Control
#
#func _ready():
	## récupère le dock depuis EditorPlugin
	#var editor_plugin = get_editor_interface().get_plugin_by_name("yetanotherpugins")
	#if editor_plugin:
		#dock = editor_plugin.dock_instance
#
	#connect("pressed", self, "_on_pressed")
#
#func _on_pressed():
	#if dock and dock.selected_scene:
		## Remplace ou ajoute la scène dans la scène principale
		#var new_scene = dock.selected_scene.instantiate()
		#get_tree().current_scene.add_child(new_scene)
		#print("Scene chargée !")
