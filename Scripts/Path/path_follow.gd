extends PathFollow

var t = 0.0
var old_offset
var new_offset
var delta_offset = 1

func _process(delta: float) -> void:
	if delta_offset > 0 and G.on_tv_enter == true:
		t += delta
		old_offset = self.offset
		self.offset = t * 10
		new_offset = self.offset
		delta_offset = new_offset - old_offset
		if self.unit_offset == 1:
			G.camera_in_gamezone = true
