extends MeshInstance

var origin_color
var material


func _ready():
	material = self.get_surface_material(0)
	origin_color = material.albedo_color


func _on_Area_mouse_entered():
	var material = self.get_surface_material(0)
	material.albedo_color = Color(1, 0, 0)
	self.set_surface_material(0, material)


func _on_Area_mouse_exited():
	material.albedo_color = origin_color
	self.set_surface_material(0, material)


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			G.on_tv_enter = true
