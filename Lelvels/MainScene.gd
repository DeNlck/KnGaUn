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
		colis = knife.move_and_collide(Vector3(0,0,5), true, true, false)
#		print("Collis class: " + str(colis.collider is KnifeTarget) )
		if colis.collider is KnifeTarget:
			print('Collision info: ' + str(colis.collider.name));
			isTouched = false
			colis = null
#			get_node("Knife").duplicate(false)
		#get_node("Knife/KnifePhys").add_central_force(Vector3(0,0,100))
	pass
	
#func _input(event):
#	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
#		isTouched = true
#	pass
