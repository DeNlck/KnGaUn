class_name Weapon extends KinematicBody

var animationController

func _init():
	G.WeaponObject = self
	
func _ready():
	self.animationController = self.get_node("AnimationController")
	pass

func _on_Weapon_bodyEntered():
	print("---------Weapon class test event-----------")
