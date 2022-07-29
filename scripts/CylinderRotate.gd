extends RigidBody

var velocity = 0.4

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (velocity * delta)) * transform.basis 
	pass
