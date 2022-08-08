class_name KnifeTarget extends RigidBody

var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	self.connect("body_entered", G.WeaponObject, "_on_Weapon_bodyEntered")
	pass

func _init():
	self.set_contact_monitor(true)	#Этот метод нужен для того, чтоб работали эвенты RigidBody
	self.set_max_contacts_reported(4)
	G.KnifeTargetObject = self

