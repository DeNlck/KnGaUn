extends Spatial

export(NodePath) var node_path

var isTouched = false
var colis = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isTouched:
		colis = get_node("Knife/KnifePhys").move_and_collide(Vector3(0,0,100), true, true, false)
		if colis:
			print('Collision info: ' + str(colis.collider.get_property_list()));
			isTouched = false
			colis = null
		#get_node("Knife/KnifePhys").add_central_force(Vector3(0,0,100))
	pass
	
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		isTouched = true
	pass
