extends Label
## Change window resolution, not really useful, use at your own risk

var id = 0
# You can set wanted resolutions here
var widths = [1920, 2560, 3440]
var heights = [1080, 1440, 1600]
var max_size


func _ready() -> void:
	# Must set to viewport mode for the resolution to make sense
	max_size = min(widths.size(), heights.size())
	set_res()


func _process(delta: float) -> void:
	pass


# This will only work if not in !! embedded mode !!
# Please, test it out of editor
func set_res() -> void:
	DisplayServer.window_set_size(Vector2i(widths[id], heights[id]))
	text = str(widths[id]) + "x" + str(heights[id])


func _on_left_pressed() -> void:
	id -= 1
	if id == -1 : 
		id = max_size - 1
	set_res()


func _on_right_pressed() -> void:
	id = (id + 1) % max_size
	set_res()
