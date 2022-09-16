class_name SimpleKnife extends MeleeWeapon

var check_pull_out = false

func _init():
	pass

func _ready():
	pass

func _process(delta):
#	self.translation.x = rand_range(0.1, 0.15)
	#Анимация доставания ножа при старте игры
	if G.camera_in_gamezone and !self.check_pull_out:
		animPlay_pull_out_knife()
	
	if self.isTouchDisplay:
		throw_knife()

func animPlay_pull_out_knife():
	self.visible = true
	self.animationController.play("pull_out_knife")
	self.check_pull_out = true

func throw_knife():
#	print(self.look_at(get_node("../Park/Trailer/CylinderPhys").transform.origin, Vector3.UP))
	self.move_and_slide(Vector3(2.8,0,4))
	pass
