class_name KnifeTarget extends RigidBody

var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	G.KnifeTarget = self
#	var selfPath = get_node(self.get_path())
#	print(G.Weapon)
#	self.connect("ready", G.Weapon, "_on_Weapon_bodyEntered")
	pass
	
func _on_Weapon_bodyEntered():
	print("====Test Weapon event connected====")
	
#func _init(tag: String, hp:int = 5):
#	self.hp = hp
#	self.tag = tag
#	pass
