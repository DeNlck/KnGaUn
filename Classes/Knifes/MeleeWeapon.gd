class_name MeleeWeapon extends KinematicBody

var isTouchDisplay
var animationController

func _init():
	G.MeleeWeaponObject = self

func _ready():
	self.animationController = self.get_node("AnimationController")
	pass

func _input(event):
	if G.camera_in_gamezone and (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			G.knife_touched = false
#			self.isTouchDisplay = true
	pass
