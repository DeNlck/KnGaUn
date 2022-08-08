extends Spatial

export(NodePath) var node_path

var isTouched = false
var colis = null
onready var knife = get_node("Knife")

var KnifeTarget = preload("res://Classes/Targets/KnifeTarget.gd")

func _ready():
	pass


func _process(delta):
	
	if isTouched:
#		knife.move_and_slide()
		colis = knife.move_and_collide(Vector3(0,0,5), true, true, false)
		if colis.collider is KnifeTarget:
			print('Collision info: ' + str(colis.collider.name));
			isTouched = false
			colis = null
	pass
	
func _input(event):
	if (event is InputEventMouseButton) and G.on_tv_enter:
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			isTouched = true
	pass
