class_name MeleeWeapon extends KinematicBody

var isTouchDisplay:bool = false
onready var animationController = self.get_node("AnimationController")
onready var rayCast = self.get_node("RayCast")
var nextObject
export var classPathScene:String
var rayCastSuccess:bool = false

func _init():
	G.MeleeWeaponObject = self
	print("***********************")
	print("MeleeWeapon was init " + str(self))
	print("G.MeleeWeaponObject " + str(G.MeleeWeaponObject))
	print("***********************")

func _ready():
#	self.animationController = self.get_node("AnimationController")
	pass

func _physics_process(delta):
	if self.rayCast.is_colliding() and !self.rayCastSuccess:
		print("RayCast job, object: " + str(self.rayCast.get_collider()) + " hit point: " + str(self.rayCast.get_collision_point()))
		G.KnifeTargetObject.meleeWeapon_attach(self, self.rayCast.get_collision_point())
		self.rayCastSuccess = true
	pass

func _input(event):
	if G.camera_in_gamezone and (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			self.isTouchDisplay = true
			self.rayCast.enabled = true
	pass

func _on_KnifeTarget_body_entered(body):
	if body as MeleeWeapon:
		self.rayCast.enabled = false
		print("KnifeTarget event body: " + str(body))
#		print("Collide bodies: " + str(self.get))
		self.isTouchDisplay = false
		self.nextObject = load(self.classPathScene).instance()
		get_node("/root/game/world").add_child(self.nextObject)
	pass
