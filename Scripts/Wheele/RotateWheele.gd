extends Spatial

var animation_player

func _ready():
	animation_player = get_node("AnimationPlayer")
	animation_player.play("Rotate")
	print("HI! I'm Wheele and i in scene")
	pass # Replace with function body.

