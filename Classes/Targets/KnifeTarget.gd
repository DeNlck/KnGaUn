class_name KnifeTarget extends RigidBody


var hp: int = 5
var isTouched: bool = false
var tag: String

var test

func _ready():
	# Ивент на столкновение объектов класса MeleeWeapon с любой целью этого класса
	print("Area info: " + str(self.get_node("Area")))
	self.call_signal()
	pass
	
func meleeWeapon_attach(object:MeleeWeapon, hit_point):
	print("I'm in meleWeapon attach")
	call_signal()
#	При перемещении объекта, срабатывает сигнал
	object.get_parent().remove_child(object)
	self.get_node("WeaponMeleeContainer").add_child(object)
	test = self.to_local(hit_point)
#	self.get_node("WeaponMeleeContainer/" + object.name).translate(test)
	object.translation.x = test.x
	object.translation.y = test.y
	object.translation.z = test.z
#	object.transform.translated(Vector3(1,0,0))
#	test = Transform(self.transform.basis, self.to_local(hit_point))
	
	print("Weapon onbject child: " + str(self.get_node("WeaponMeleeContainer").get_children()))
	print("Weapon onbject position to local: " + str(self.to_local(hit_point)))
#	print("Weapon onbject position test: " + str(test.origin))
	print("Weapon onbject global position: " + str(object.transform.origin))
	print("Weapon onbject local position: " + str(self.get_node("WeaponMeleeContainer/" + object.name).transform.origin))
	pass

func call_signal():
	print("---Call signal!! Id obj: " + str(G.MeleeWeaponObject))
	self.get_node("Area").connect("body_entered", G.MeleeWeaponObject, "_on_KnifeTarget_body_entered")

func _init():
	G.KnifeTargetObject = self
