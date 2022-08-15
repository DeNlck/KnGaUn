class_name MeleeWeapon extends KinematicBody

var isTouchDisplay:bool = false
onready var animationController = self.get_node("AnimationController")
onready var rayCast = self.get_node("RayCast")
var nextObject
export var classPathScene:String
var rayCastSuccess:bool = true

func _init():
	G.MeleeWeaponObject = self
	print("***********************")
	print("MeleeWeapon was init " + str(self))
	print("G.MeleeWeaponObject " + str(G.MeleeWeaponObject))
	print("***********************")

func _ready():
#	self.animationController = self.get_node("AnimationController")
	print("Weapon ready. Path: " + self.get_path())
	pass

func _physics_process(delta):
	if self.rayCast.is_colliding() and !self.rayCastSuccess:
		print("RayCast job, object: " + str(self.rayCast.get_collider()) + " hit point: " + str(self.rayCast.get_collision_point()))
		
		self.nextObject = load(self.classPathScene).instance()
		G.KnifeTargetObject.meleeWeapon_attach(self,self.rayCast.get_collision_point())
		get_node("/root/game/world").add_child(self.nextObject)
		
		self.rayCastSuccess = true
		self.rayCast.enabled = false
		#Хз зачем, пока удаляю скрипт у объекта и ненужные ноды, чтоб не грузили процесс
		#В идеале нужно подменять сцену с объектом на болванку?
		self.animationController.queue_free()
		self.rayCast.queue_free()
		self.set_script(null)
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
