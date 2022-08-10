class_name SimpleKnife extends MeleeWeapon

var check_pull_out = false

func _init():
	pass

func _ready():
	pass

func _process(delta):
	#Анимация доставания ножа при старте игры
	if G.camera_in_gamezone and !self.check_pull_out:
		animPlay_pull_out_knife()
	
	if !G.knife_touched:
		throw_knife()

func animPlay_pull_out_knife():
	self.visible = true
	self.animationController.play("pull_out_knife")
	self.check_pull_out = true

func throw_knife():
	self.move_and_slide(Vector3(0,0,4))
	pass
