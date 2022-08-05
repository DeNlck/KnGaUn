class_name Cylinder extends KnifeTarget

export var rotateVelocity = 0.4

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (rotateVelocity * delta)) * transform.basis 
	pass

