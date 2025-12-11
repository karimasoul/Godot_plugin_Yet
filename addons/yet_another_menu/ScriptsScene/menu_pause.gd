extends CanvasLayer
## Other functions for various signals

@export var MainMenu : PackedScene


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel") :
		_on_unpause_btn_pressed()


func _on_unpause_btn_pressed() -> void:
	visible = false


func _on_sound_button_toggled(toggled_on: bool) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, toggled_on)


func _on_sound_slider_value_changed(value: float) -> void:
	var min_volume = -60
	var bus_idx = AudioServer.get_bus_index("Master")
	# This calcul makes it approximately smooth on ear
	AudioServer.set_bus_volume_db(bus_idx, min_volume + 
			(exp(value / 100)-1)/(exp(1)-1)*-min_volume)


# This will go back to the main menu, you have to set it in the inspector
func _load_scene() -> void:
	get_tree().change_scene_to_packed(MainMenu)
