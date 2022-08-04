extends Spatial

export(NodePath) var node_path

var isTouched = false
var colis = null

var KnifeTarget = preload("res://Classes/Targets/KnifeTarget.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	var cylinder = KnifeTarget.new(5)
	
	
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isTouched:
		colis = get_node("Knife/KnifePhys").move_and_collide(Vector3(0,0,100), true, true, false)
		if colis.collider.name == "CylinderPhys":
			print('Collision info: ' + str(colis.collider.name));
			isTouched = false
			colis = null
#			get_node("Knife").duplicate(false)
		#get_node("Knife/KnifePhys").add_central_force(Vector3(0,0,100))
	pass
	
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		isTouched = true
	pass
