class_name Cylinder extends KnifeTarget

export var rotateVelocity = 0.4

func _init():
	pass
	
func _ready():
	print("***********************")
	print("Object: " + str(self))
	print("Contact monitor: " + str(self.is_contact_monitor_enabled()))
	print("Max contacts reported: " + str(get_max_contacts_reported()))
	print("***********************")
	pass

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (rotateVelocity * delta)) * transform.basis 
	pass
