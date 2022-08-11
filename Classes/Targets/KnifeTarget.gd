class_name KnifeTarget extends RigidBody


var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	# Ивент на столкновение объектов класса MeleeWeapon с любой целью этого класса
	self.get_node("Area").connect("body_entered", G.MeleeWeaponObject, "_on_KnifeTarget_body_entered")
	pass

func _init():
	G.KnifeTargetObject = self
