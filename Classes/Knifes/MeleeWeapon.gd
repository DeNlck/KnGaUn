class_name MeleeWeapon extends KinematicBody

var isTouchDisplay:bool = false
onready var animationController = self.get_node("AnimationController")
onready var rayCast = self.get_node("RayCast")
var nextObject
export var classPathScene:String
var rayCastSuccess:bool = true
onready var startPosition:Vector3 = get_node("/root/game/world/WeaponStartPosition").transform.origin
onready var startRotation = get_node("/root/game/world/WeaponStartPosition").global_transform.basis

func _init():
	G.MeleeWeaponObject = self
	print("***********************")
	print("MeleeWeapon was init " + str(self))
	print("G.MeleeWeaponObject " + str(G.MeleeWeaponObject))
	print("***********************")

func _ready():
	pass

func _physics_process(delta):
	if self.rayCast.is_colliding() and !self.rayCastSuccess:
#		print("RayCast job, object: " + str(self.rayCast.get_collider()) + " hit point: " + str(self.rayCast.get_collision_point()))	
		G.KnifeTargetObject.meleeWeapon_attach(self,self.rayCast.get_collision_point())
		self.rayCastSuccess = true
		self.rayCast.enabled = false
		
		self.instance_new_object()
		self.delete_needlees_nodes()
	pass

func _input(event):
	if G.camera_in_gamezone and (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			self.isTouchDisplay = true
			self.rayCast.enabled = true
	pass

func _on_KnifeTarget_body_entered(body):
	if body as MeleeWeapon:
		print("KnifeTarget event body: " + str(body))
		self.isTouchDisplay = false
		self.rayCastSuccess = false
	pass

func collide_same_object():
	print("------ CollideSameObject!")
	G.KnifeTargetObject.delete_signal()
	
	self.instance_new_object()
	self.delete_completely_node()
	pass

func instance_new_object():
	self.nextObject = load(self.classPathScene).instance()
	G.KnifeTargetObject.call_signal()
	get_node("/root/game/world").add_child(self.nextObject)
	self.nextObject.translate(self.startPosition)
	self.nextObject.global_transform.basis = self.startRotation
#	self.nextObject.get_parent().translation.x = self.startPosition.x
#	self.nextObject.get_parent().translation.y = self.startPosition.y
#	self.nextObject.get_parent().translation.z = self.startPosition.z
	pass
	
func delete_needlees_nodes():
	#Хз зачем, пока удаляю скрипт у объекта и ненужные ноды, чтоб не грузили процесс
	#В идеале нужно подменять сцену с объектом на болванку?
	self.animationController.queue_free()
	self.rayCast.queue_free()
	self.set_script(null)

func delete_completely_node():
	self.queue_free()
