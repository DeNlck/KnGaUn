class_name Cylinder extends KnifeTarget

export var defaultRotateVelocity = 0.4
var settingsRotateVelocity = self.defaultRotateVelocity

onready var TweenCylinder = self.get_node("Tween")

var activeDestructCylinderTop
var animationTree
var animationPlayer
var animation
var track_index
var animDeleteObject

var piece_scene
var piece_object

onready var cylinderGroup = self.get_tree().get_nodes_in_group("cylinder_piece")
onready var cylinderTopPiece = cylinderGroup[0].get_node("Spatial").transform.origin.y
onready var cylinderStepSize = cylinderTopPiece - cylinderGroup[1].get_node("Spatial").transform.origin.y
onready var cylinderLastPiece = cylinderGroup[cylinderGroup.size() - 1].get_node("Spatial").transform.origin.y - self.cylinderStepSize 

var cylinderArray = {}
var moveAllPieces = false

func _init():
	pass
	
func _ready():
	self.init_piece_property()
	self.init_piece_anim()

	for i in range(6):
		#	Сохраняем изначальные позиции "y" от каждой части цилиндра. Потом на эти значения передвигаем нижние части
		self.cylinderArray[i] = self.cylinderGroup[i].get_node("Spatial").transform.origin
	pass

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (settingsRotateVelocity * delta)) * transform.basis
	
	if moveAllPieces:
		self.move_up_each_object(delta)
	pass

func move_up_each_object(delta):
	var test_array = self.get_node("CylinderShape").get_tree().get_nodes_in_group("cylinder_piece")
	var test_array2 = test_array
	
	if (test_array.size() != 0):
		for i in range(test_array.size()):
			
#			test_array[i].get_node("Spatial").transform.origin.y = lerp(test_array[i].get_node("Spatial").transform.origin.y, self.cylinderArray[i], 0.25)
#			test_array[i].get_node("Spatial").transform.origin = test_array[i].get_node("Spatial").transform.origin.linear_interpolate(self.cylinderArray[i],0.25)
			self.TweenCylinder.interpolate_property(test_array[i].get_node("Spatial"), "translation", test_array[i].get_node("Spatial").transform.origin, self.cylinderArray[i], 0.05, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
			self.TweenCylinder.start()
			
		if is_equal_approx(stepify(test_array[0].get_node("Spatial").transform.origin.y,0.001), stepify(self.cylinderTopPiece, 0.001)):
			moveAllPieces = false
			test_array[0].name = "DestructCylinderTop"
			
			self.init_piece_property()
			self.init_piece_anim()
#			print("In Group: " + str(self.get_node("CylinderShape").get_tree().get_nodes_in_group("cylinder_piece")))
			
			self.hp = 4
			G.isTargetActionFinished = true
	else:
		return false
	pass

func visual_destruct_object():
	G.isTargetActionFinished = false

	self.get_node("CylinderShape").add_child(self.piece_scene)
	self.piece_scene.get_node("Spatial").transform.origin.y = self.cylinderLastPiece
	self.piece_scene.get_node("Spatial").rotation = Vector3(0,rand_range(0,360),0)


	self.animationTree.active = true
	self.WeaponMeleeContainer.visible = false
	pass
	
func delete_object():
#	self.activeDestructCylinderTop.remove_from_group("cylinder_piece")
	self.activeDestructCylinderTop.queue_free()
	
	self.TweenCylinder.start()
	self.moveAllPieces = true
	pass

func init_piece_property():
	self.activeDestructCylinderTop = self.get_node("CylinderShape/DestructCylinderTop")
	self.WeaponMeleeContainer = self.activeDestructCylinderTop.get_node("WeaponMeleeContainer")
	self.animationTree = self.activeDestructCylinderTop.get_node("AnimationTree")
	self.animationPlayer = self.activeDestructCylinderTop.get_node("AnimationPlayer")
	self.animDeleteObject = self.animationPlayer.get_animation("delete_object")
	
	
	self.piece_scene = load("res://Assets/Targets/Cylinder/DestructCylinder.tscn").instance()
	pass
	
func init_piece_anim():
	self.track_index = self.animDeleteObject.add_track(Animation.TYPE_METHOD)
	self.animDeleteObject.track_set_path(self.track_index, self.get_path())
	self.animDeleteObject.track_insert_key(self.track_index, 0.2, {"method" : "delete_object" , "args" : []})
	pass
