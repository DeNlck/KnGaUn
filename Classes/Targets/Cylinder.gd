class_name Cylinder extends KnifeTarget

export var rotateVelocity = 0.4

onready var activeDestructCylinderTop = self.get_node("CylinderShape/DestructCylinderTop")
onready var animationTree = self.activeDestructCylinderTop.get_node("AnimationTree")

func _init():
	pass
	
func _ready():
#	print("***********************")
#	print("Object: " + str(self))
#	print("Contact monitor: " + str(self.is_contact_monitor_enabled()))
#	print("Max contacts reported: " + str(get_max_contacts_reported()))
#	print("***********************")
	self.WeaponMeleeContainer = self.activeDestructCylinderTop.get_node("WeaponMeleeContainer")
	pass

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (rotateVelocity * delta)) * transform.basis
	pass
	
func visual_destruct_object():
	self.animationTree.active = true
	self.WeaponMeleeContainer.visible = false
	pass

func delete_object():
	self.activeDestructCylinderTop.queue_free()
	pass
