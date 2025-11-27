extends Label

var id

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match (DisplayServer.window_get_vsync_mode()):
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func pressLeft() -> void:
#	id -= 1
#	if (id == -1) : id = 3
#	changeMode()
func _on_left_pressed() -> void:
	id -= 1
	if (id == -1) : id = 3
	changeMode()
	
#func pressRight() -> void:
#	id = (id + 1) % 4
#	changeMode()
	
func _on_right_pressed() -> void:
	id = (id + 1) % 4
	changeMode()

#will only work if not in !! embedded mode !!
#test out of editor
func changeMode() -> void:
	match (id):
		0 :
			DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_DISABLED)
			text = "Off"
		1 :
			DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_ENABLED)
			text = "On"
		2 :
			DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_ADAPTIVE)
			text = "adaptative"
		3 :
			DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_MAILBOX)
			text = "mailbox"
