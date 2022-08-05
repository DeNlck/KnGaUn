class_name KnifeTarget extends RigidBody

var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	var selfPath = get_node(self.get_path())
	selfPath.connect("body_entered", Weapon, "_on_Weapon_bodyEntered")
	pass
	
func _on_Weapon_bodyEntered():
	print("Weapon body entered!!!!!!!!!!!!!!!")
	pass

#func _init(tag: String, hp:int = 5):
#	self.hp = hp
#	self.tag = tag
#	pass
