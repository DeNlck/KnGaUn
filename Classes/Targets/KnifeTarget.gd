class_name KnifeTarget extends RigidBody


var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	# Ивент на столкновение объектов класса MeleeWeapon с любой целью этого класса
	print("Area info: " + str(self.get_node("Area")))
	self.get_node("Area").connect("body_entered", G.MeleeWeaponObject, "_on_KnifeTarget_body_entered")
	pass
	
func meleeWeapon_attach(object:MeleeWeapon, pos):
	print("Weapon onbject: " + str(object))
	self.add_child_below_node ( self, object, true )
	print("Weapon onbject child: " + str(self.get_children()))
	pass

func _init():
	G.KnifeTargetObject = self
