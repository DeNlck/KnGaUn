extends KinematicBody


var isTouched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isTouched:
		get_node("Knife/KnifePhys").move_and_collide(Vector3(0,0,100), true, true, false)
		#get_node("Knife/KnifePhys").add_central_force(Vector3(0,0,100))
	pass
	
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		isTouched = true
	pass

