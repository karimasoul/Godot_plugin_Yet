extends Label

var id = 0
#set wanted resolutions here
var widths = [1920, 2560, 3440]
var heights = [1080, 1440, 1600]
var maxSize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Must set to viewport for the resolution to make sense
	maxSize = min(widths.size(), heights.size())
	setRes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#will only work if not in !! embedded mode !!
#test out of editor
func setRes() -> void:
	DisplayServer.window_set_size(Vector2i(widths[id], heights[id]))
	text = str(widths[id]) + "x" + str(heights[id])


func _on_left_pressed() -> void:
	id -= 1
	if (id == -1) : id = maxSize - 1
	setRes()


func _on_right_pressed() -> void:
	id = (id + 1) % maxSize
	setRes()
	
	
	
#func pressLeft() -> void:
#	id -= 1
#	if (id == -1) : id = maxSize - 1
#	setRes()
	
#func pressRight() -> void:
#	id = (id + 1) % maxSize
#	setRes()
