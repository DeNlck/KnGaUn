extends Spatial

var animation_player

func _ready():
	animation_player = get_node("AnimationPlayer")
	animation_player.play("Rotate")
	pass
