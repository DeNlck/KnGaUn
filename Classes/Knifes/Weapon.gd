class_name Weapon extends KinematicBody

func _ready():
	G.Weapon = self
	print("Weapon spawned!")
#	self.connect("ready", G.KnifeTarget, "_on_KnifeTarget_bodyEntered")
	print(G.KnifeTarget)
	self.connect("ready", G.KnifeTarget, "_on_Weapon_bodyEntered")
	pass


#func _on_Weapon_bodyEntered():
#	print("====Test Weapon event connected====")
