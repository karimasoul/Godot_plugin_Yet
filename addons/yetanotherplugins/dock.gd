@tool
extends Control

var editor_interface: EditorInterface

# bouton du dock 
@onready var button_node: Button = $VBoxContainer/Button 

func _ready():
	if button_node:
		button_node.pressed.connect(_on_toggle)
	else:
		print("Bouton du dock introuvable.")

func _on_toggle():
	if not editor_interface:
		return

	var root = editor_interface.get_edited_scene_root()
	if not root:
		return

	# toggle VBoxContainer entier dans la scène ouverte
	var target_vbox = root.get_node("VBoxContainer")
	if target_vbox:
		target_vbox.visible = !target_vbox.visible
	else:
		print("VBoxContainer introuvable dans la scène ouverte.")
