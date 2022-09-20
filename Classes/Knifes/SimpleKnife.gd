class_name SimpleKnife extends MeleeWeapon

var check_pull_out = false
var throw_vector = Vector3(0.056,0,0.08)
var position_info

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
	position_info = self.move_and_collide(throw_vector)
	print("Name knife: " + str(self.get_path()))
	if position_info:
		print("Position_info: " + str(position_info.collider))
		# Если последняя позиция ножа не равна вектору броска и столкнулся с любым киниматиком
		if position_info.collider is KinematicBody:
			self.isTouchDisplay = false
			self.animationController.play("collide_to_knife")
		
#		self.collide_same_object()
#		print("Collide to: " + str(self.get_slide_collision(1).collider) + " " + str(self.get_slide_collision(1).collider is KinematicBody))
	pass
