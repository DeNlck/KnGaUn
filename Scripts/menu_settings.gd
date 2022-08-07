extends Control


func _on_btn_back_pressed():
	queue_free()
	G.sub("menu_pause")


func _on_btn_default_pressed():
	$Panel/music_on.pressed = true
	$Panel/music_volume.value = 50


func _on_btn_save_pressed():
	var music_volume = $Panel/music_volume.value
	var music_enable = $Panel/music_on.pressed
	Settings.set_settings(music_volume, music_enable)
	Settings.save_settings()
