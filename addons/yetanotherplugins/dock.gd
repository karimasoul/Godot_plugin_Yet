@tool
extends Control

var editor_interface: EditorInterface

# Le bouton existant dans le dock
@onready var button_node: Button = $Button

func _ready():
	if button_node:
		button_node.pressed.connect(_on_toggle)
	else:
		print("⚠️ Bouton introuvable dans le dock.")

func _on_toggle():
	if not editor_interface:
		return

	# Récupèrer la scène ouverte dans l'éditeur
	var root = editor_interface.get_edited_scene_root()
	if not root:
		return

	# Récupèrer le bouton enfant direct de Control dans la scène ouverte
	var target_button = root.get_node("Button")  
	if target_button:
		target_button.visible = !target_button.visible
