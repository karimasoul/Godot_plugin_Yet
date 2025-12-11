extends Label

var id = -1 :
	set(value):
		if value == id :
			return
		id = value
		changeMode()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match (DisplayServer.window_get_mode()):
		DisplayServer.WindowMode.WINDOW_MODE_WINDOWED :
			id = 0
		DisplayServer.WindowMode.WINDOW_MODE_MAXIMIZED :
			id = 0
		DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN :
			id = 1
		DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN :
			id = 2

func _on_left_pressed() -> void:
	var temp = id - 1
	if (temp == -1) : id = 2
	else : id = temp
	
#func pressLeft() -> void:
#	var temp = id - 1
#	if (temp == -1) : id = 2
#	else : id = temp

func _on_right_pressed() -> void:
	id = (id + 1) % 3
	
#func pressRight() -> void:
#	id = (id + 1) % 3

# This will only work if not in !! embedded mode !!
# Please, test out of editor
# if not in canvas-item or viewportt,
# the scene may not properly show fullscreen
func changeMode() -> void:
	match (id):
		0 :
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
			text = "windowed"
		1 :
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
			text = "fullscreen  borderless"
		2 :
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			text = "fullscreen"
