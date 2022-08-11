class_name MeleeWeapon extends KinematicBody

var isTouchDisplay:bool = false
var animationController
var nextObject
export var classPathScene:String

func _init():
	G.MeleeWeaponObject = self
	print("***********************")
	print("MeleeWeapon was init " + str(self))
	print("G.MeleeWeaponObject " + str(G.MeleeWeaponObject))
	print("***********************")

func _ready():
	self.animationController = self.get_node("AnimationController")
	pass

func _input(event):
	if G.camera_in_gamezone and (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			self.isTouchDisplay = true
	pass

func _on_KnifeTarget_body_entered(body):
	if body as MeleeWeapon:
		print("KnifeTarget event body: " + str(body))
		self.isTouchDisplay = false
		self.nextObject = load(self.classPathScene).instance()
		get_node("/root/game/world").add_child(self.nextObject)
	pass
