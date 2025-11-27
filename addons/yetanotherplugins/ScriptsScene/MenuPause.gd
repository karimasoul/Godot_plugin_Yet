extends Control


func _on_unpause_btn_pressed() -> void:
	visible = false


func _on_sound_button_toggled(toggled_on: bool) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, toggled_on)


func _on_sound_slider_value_changed(value: float) -> void:
	var minVolume = -60
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, minVolume + (exp(value / 100)-1)/(exp(1)-1)*-minVolume)
