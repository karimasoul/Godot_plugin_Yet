@tool
extends Control

var editor_interface: EditorInterface

# bouton du dock 
@onready var hide_volume: CheckBox = $VBoxContainer/CheckBox
@onready var hide_window: CheckBox = $VBoxContainer2/CheckBox
@onready var hide_resolution: CheckBox = $VBoxContainer3/CheckBox
@onready var hide_vertical: CheckBox = $VBoxContainer4/CheckBox


func _ready():
	hide_volume.button_pressed = true
	hide_window.button_pressed = true
	hide_resolution.button_pressed = true
	hide_vertical.button_pressed = true
	if hide_volume:
		hide_volume.toggled.connect(_on_toggled_volume)
	else:
		print("Bouton du dock introuvable.")
	
	if hide_window: 
		hide_window.toggled.connect(_on_toggled_window)
	else:
		print("Bouton du dock introuvable.")
		
	if hide_resolution: 
		hide_resolution.toggled.connect(_on_toggled_resolution)
	else:
		print("Bouton du dock introuvable.")
		
	if hide_vertical: 
		hide_vertical.toggled.connect(_on_toggled_vertical)
	else:
		print("Bouton du dock introuvable.")

func _on_toggled_volume(checked: bool):
	if not editor_interface:
		return 
	var scene = editor_interface.get_edited_scene_root()
	var target_volume = scene.get_node("OverallBox/OptionsBox/VolumeBox")
	
	if target_volume:
		target_volume.visible = checked
	else:
		print("Node introuvable")

func _on_toggled_window(checked: bool):
	if not editor_interface:
		return 
	var scene = editor_interface.get_edited_scene_root()
	var target_window = scene.get_node("OverallBox/OptionsBox/WindowBox")
	
	if target_window:
		target_window.visible = checked
	else:
		print("Node introuvable")
	
func _on_toggled_resolution(checked: bool):
	if not editor_interface:
		return 
	var scene = editor_interface.get_edited_scene_root()
	var target_resolution = scene.get_node("OverallBox/OptionsBox/ResolutionBox")
	
	if target_resolution:
		target_resolution.visible = checked
	else:
		print("Node introuvable")

func _on_toggled_vertical(checked: bool):
	if not editor_interface:
		return 
	var scene = editor_interface.get_edited_scene_root()
	var target_vertical = scene.get_node("OverallBox/OptionsBox/VerticalSyncBox")
	
	if target_vertical:
		target_vertical.visible = checked
	else:
		print("Node introuvable")
#func _on_toggle():
#	var scene = editor_interface.get_edited_scene_root()
#	if not scene:
#		print("aucune scene ouverte")
#		return
#	var target = scene.get_node("OverallBox/OptionsBox/VolumeBox")
#	if target:
#		target.visible = !target.visible
#	else:
#		print("node introuvable", scene.name)
	#if not editor_interface:
	#	return

	#var root = editor_interface.get_edited_scene_root()
	#if not root:
	#	return

	# toggle VBoxContainer entier dans la scène ouverte
	#var target_vbox = root.get_node("VBoxContainer")
	#if target_vbox:
	#	target_vbox.visible = !target_vbox.visible
	#	print(target_vbox.get_children())
	#else:
	#	print("VBoxContainer introuvable dans la scène ouverte.")
