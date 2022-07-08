extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#apply_impulse(Vector3(0,0,10), Vector3(0,0,5));
	#self.add_force(Vector3(0,0,10), Vector3(0,0,5))
	self.add_central_force(Vector3(0,0,1000));
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.add_central_force(Vector3(0,0,10 * delta));
	pass
