extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		G.resume_game()
		queue_free()


func _on_btn_resume_pressed():
	G.resume_game()
	queue_free()


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_mode_pressed():
	pass
	


func _on_btn_settings_pressed():
	G.open_settings()
	queue_free()
