extends Label
## Change Vertical sync option

var id


func _ready() -> void:
	match DisplayServer.window_get_vsync_mode():
		DisplayServer.VSyncMode.VSYNC_DISABLED :
			text = "Off"
			id = 0
		DisplayServer.VSyncMode.VSYNC_ENABLED :
			text = "On"
			id = 1
		DisplayServer.VSyncMode.VSYNC_ADAPTIVE :
			text = "adaptative"
			id = 2
		DisplayServer.VSyncMode.VSYNC_MAILBOX :
			text = "mailbox"
			id = 3


func _process(_delta: float) -> void:
	pass


func _on_left_pressed() -> void:
	id -= 1
	if id == -1 : 
		id = 3
	change_mode()


func _on_right_pressed() -> void:
	id = (id + 1) % 4
	change_mode()


func change_mode() -> void:
	match id:
		0 :
			DisplayServer.window_set_vsync_mode(
					DisplayServer.VSyncMode.VSYNC_DISABLED)
			text = "Off"
		1 :
			DisplayServer.window_set_vsync_mode(
					DisplayServer.VSyncMode.VSYNC_ENABLED)
			text = "On"
		2 :
			DisplayServer.window_set_vsync_mode(
					DisplayServer.VSyncMode.VSYNC_ADAPTIVE)
			text = "adaptative"
		3 :
			DisplayServer.window_set_vsync_mode(
					DisplayServer.VSyncMode.VSYNC_MAILBOX)
			text = "mailbox"
