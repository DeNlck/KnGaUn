class_name Cylinder extends KnifeTarget

export var defaultRotateVelocity = 0.4
var settingsRotateVelocity = self.defaultRotateVelocity

var pieceCylinderObject
export var classPathPieceCylinder:String

onready var activeDestructCylinderTop = self.get_node("CylinderShape/DestructCylinderTop")
onready var animationTree = self.activeDestructCylinderTop.get_node("AnimationTree")

var startPositionPieceCylinder
var startRotationPieceCylinder

onready var cylinderGroup = self.get_tree().get_nodes_in_group("cylinder_piece")
onready var cylinderTopPiece = cylinderGroup[0].get_node("Spatial").transform.origin.y
onready var cylinderLastPiece = cylinderGroup[cylinderGroup.size() - 1].get_node("Spatial").transform.origin.y
onready var cylinderStepSize = cylinderTopPiece - cylinderGroup[1].get_node("Spatial").transform.origin.y

var cylinderArray = {}
var moveAllPieces = false


func _init():
	pass
	
func _ready():
#	print("***********************")
#	print("Object: " + str(self))
#	print("Contact monitor: " + str(self.is_contact_monitor_enabled()))
#	print("Max contacts reported: " + str(get_max_contacts_reported()))
#	print("***********************")

	self.WeaponMeleeContainer = self.activeDestructCylinderTop.get_node("WeaponMeleeContainer")
	
#	print("Top Piece: " + str(cylinderTopPiece) + " Last Piece: " + str(cylinderLastPiece) + " Step Size: " + str(cylinderStepSize))

	for i in range(6):
		#	Сохраняем изначальные позиции "y" от каждой части цилиндра. Потом на эти значения передвигаем нижние части
		self.cylinderArray[i] = self.cylinderGroup[i].get_node("Spatial").transform.origin.y
		#Сохраняем стартовые позиции (которые стоят на данный момент в сцене заранее, вне игры) части цилиндра
		var startPositionPieceCylinder = self.cylinderGroup[i].transform.origin
		var startRotationPieceCylinder = self.cylinderGroup[i].global_transform.basis
		
		self.pieceCylinderObject = load(self.classPathPieceCylinder).instance()
		self.get_node("CylinderShape").add_child(self.pieceCylinderObject)
		self.name = self.cylinderGroup[i].name
		self.pieceCylinderObject.translate(self.startPositionPieceCylinder)
		self.pieceCylinderObject.global_transform.basis = self.startRotationPieceCylinder
		
		# Удаляем объект, который был поставлен на сцене, так как на его место инстанцировали дочерний объект
		self.cylinderGroup[i].queue_free()
	pass

func _process(delta):
	transform.basis = Basis(Vector3(0, 1, 0), (settingsRotateVelocity * delta)) * transform.basis
	
	if moveAllPieces:
		self.move_up_each_object(delta)
	pass

func move_up_each_object(delta):
	var test_array = self.get_tree().get_nodes_in_group("cylinder_piece")
	for i in range(test_array.size()):
		
		test_array[i].get_node("Spatial").transform.origin.y = lerp(test_array[i].get_node("Spatial").transform.origin.y, self.cylinderArray[i], 0.25)
#		test_array[i].get_node("Spatial").transform.origin.y = linear_interpolate(self.cylinderArray[i],0.25)
	
	if is_equal_approx(test_array[0].get_node("Spatial").transform.origin.y, self.cylinderTopPiece):
		moveAllPieces = false
		print("All pieces moved!!!")
		test_array[0].name = "DestructCylinderTop"
		self.activeDestructCylinderTop = self.get_node("CylinderShape/DestructCylinderTop")
		self.WeaponMeleeContainer = self.activeDestructCylinderTop.get_node("WeaponMeleeContainer")
		self.animationTree = self.activeDestructCylinderTop.get_node("AnimationTree")
		self.hp = 4
		G.isTargetActionFinished = true
		print(self.get_tree().get_nodes_in_group("cylinder_piece"))
	pass

func visual_destruct_object():
	G.isTargetActionFinished = false
	self.animationTree.active = true
	self.WeaponMeleeContainer.visible = false
	pass
