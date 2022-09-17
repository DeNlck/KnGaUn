class_name KnifeTarget extends RigidBody


var hp: int = 5
var isTouched: bool = false
var tag: String

var test
var posTest
var rotateTest

func _ready():
	# Ивент на столкновение объектов класса MeleeWeapon с любой целью этого класса
	print("Area info: " + str(self.get_node("Area")))
	self.call_signal()
	pass
	
func meleeWeapon_attach(object:MeleeWeapon, hit_point):
	print("I'm in meleWeapon attach")
	print("Weapon onbject global rotation: " + str(object.rotation_degrees))
	delete_signal()
	rotateTest = object.global_transform.basis
	object.get_parent().remove_child(object)
	self.get_node("WeaponMeleeContainer").add_child(object)
	test = self.to_local(hit_point)
#	self.get_node("WeaponMeleeContainer/" + object.name).translate(test)
	object.translation.x = test.x
	object.translation.y = test.y
	object.translation.z = test.z
	object.global_transform.basis = rotateTest
#	object.look_at(self.transform.origin, -Vector3.UP)
#	object.rotation_degrees.y = object.rotation_degrees.abs().y
#	object.rotation_degrees.z = object.rotation_degrees.abs().z
#	object.transform.translated(Vector3(1,0,0))
#	test = Transform(self.transform.basis, self.to_local(hit_point))
	# 	Collision knife scale X - Knife translation Z - RayCast translation X = result
	#	Knife tranlation X = result
	
#	print("Weapon onbject child: " + str(self.get_node("WeaponMeleeContainer").get_children()))
#	print("Weapon onbject position hit point: " + str(hit_point))
#	print("Weapon onbject position to local: " + str(self.to_local(hit_point)))
#	print("Weapon onbject global position: " + str(object.transform.origin))
#	print("Weapon onbject local position: " + str(self.get_node("WeaponMeleeContainer/" + object.name).transform.origin))
#	print("Weapon onbject local rotation: " + str(object.rotation_degrees))
#	print("Weapon onbject position test: " + str(posTest) + " val: " + str(object.get_node("Collision").scale.x) + " " + str(object.translation.z) + " " + str(object.get_node("RayCast").translation.x))
	pass

func delete_signal():
	print("---Signal disconnected!")
	self.get_node("Area").disconnect("body_entered", G.MeleeWeaponObject, "_on_KnifeTarget_body_entered")
	G.MeleeWeaponObject = null
	
func call_signal():
	print("---Call signal!! Id obj: " + str(G.MeleeWeaponObject))
	self.get_node("Area").connect("body_entered", G.MeleeWeaponObject, "_on_KnifeTarget_body_entered")

func _init():
	G.KnifeTargetObject = self
