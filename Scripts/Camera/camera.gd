extends Camera

var target

func _ready():
	target = get_node("/root/game/world/GameZone")

func _process(delta):
	self.look_at(target.global_transform.origin, Vector3(0,1,0))
