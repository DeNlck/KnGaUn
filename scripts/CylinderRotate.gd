extends RigidBody


# Declare member variables here. Examples:
# var a = 2
var velocity = 0.4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (velocity * delta)) * transform.basis 
	pass