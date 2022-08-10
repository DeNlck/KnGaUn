class_name KnifeTarget extends RigidBody


var hp: int = 5
var isTouched: bool = false
var tag: String

func _ready():
	self.get_node("Area").connect("body_entered", self, "_on_KnifeTarget_body_entered")
	pass

func _init():
	G.KnifeTargetObject = self
	G.knife_touched = true
	
func _on_KnifeTarget_body_entered(body):
	if body is MeleeWeapon:
		G.knife_touched = true
	pass
