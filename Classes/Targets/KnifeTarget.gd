class_name KnifeTarget extends RigidBody

var hp: int = 5
var isTouched: bool = false
var tag: String

var pathArea

func _ready():
#	self.connect("body_entered", self, "_on_Weapon_bodyEntered")
	self.get_node("Area").connect("body_entered", self, "_on_Area_body_entered")
	pass

func _init():
	self.set_contact_monitor(true)	#Этот метод нужен для того, чтоб работали эвенты RigidBody
	self.set_max_contacts_reported(100)
	G.KnifeTargetObject = self

func _on_Weapon_bodyEntered(body:Node):
	print("Test event Knife")
	
func _on_Area_body_entered(body):
	print("Test event body entered!!!!! Body: " + str(body))
	pass
