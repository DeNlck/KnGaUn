extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		get_node("Knife/KnifePhys").add_central_force(Vector3(0,0,100));
	pass
