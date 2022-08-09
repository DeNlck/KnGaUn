class_name SimpleKnife extends Weapon

var check = false

func _init():
	pass

func _ready():
	pass

func _process(delta):
	if G.camera_in_gamezone and !check:
		animPlay_pull_out_knife()

func animPlay_pull_out_knife():
	self.animationController.play("pull_out_knife")
	check = true
