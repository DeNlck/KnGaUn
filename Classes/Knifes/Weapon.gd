class_name Weapon extends KinematicBody

func _init():
	G.WeaponObject = self
	
func _ready():
	pass

func _on_Weapon_bodyEntered():
	print("---------Weapon class test event-----------")
