extends Camera2D

# if middle click is pressed or not
var pressed
# how much we zoom in/out at a time
export var zoom_constant = Vector2(0.05, 0.05)
# how much we scroll at a time
export var scroll_constant = 1.5

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		# don't zoom in past 0
		if zoom > zoom_constant:
			zoom -= zoom_constant

	elif event.is_action_pressed("zoom_out"):
		# don't zoom out past 1
		if zoom <= Vector2(1, 1) - zoom_constant:
			zoom += zoom_constant

	if event is InputEventMouseMotion:
		if pressed:
			# event.relative is what direction the mouse is moving
			# multiply by zoom so that it isn't hard to control when we're zoomed in a lot
			# multiply by -1 to reverse direction; when the mouse goes left, the camera goes right
			position += event.relative * zoom * -1

	if event is InputEventMouseButton:
		if event.button_index == 3:
			pressed = event.pressed

func _process(delta: float) -> void:
	var scroll_amt = scroll_constant * zoom.x
	if Input.is_action_pressed("up"):
		position.y -= scroll_amt
	if Input.is_action_pressed("down"):
		position.y += scroll_amt
	if Input.is_action_pressed("left"):
		position.x -= scroll_amt
	if Input.is_action_pressed("right"):
		position.x += scroll_amt
