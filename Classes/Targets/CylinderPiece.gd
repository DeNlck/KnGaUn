class_name CylinderPiece extends Cylinder

func _init():
	print("~~~~~~~~~CylinderPiece init")
	pass

func _ready():
	print("~~~~~~~~~CylinderPiece init")
	pass

func _process(delta):
	pass

func delete_object():
	self.remove_from_group("cylinder_piece")
	self.queue_free()
	self.moveAllPieces = true
	pass
