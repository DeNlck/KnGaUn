extends Control


func set_settings():
	$Panel/music_on.pressed = Settings.settings["options"]["music_enable"]
	$Panel/music_volume.value = Settings.settings["options"]["music_volume"]
	Settings.bg_music.set_volume_db($Panel/music_volume.value)
	if Settings.bg_music.volume_db < -23:
		Settings.bg_music.set_volume_db(-80)

	
	
func _on_btn_save_pressed():
	var music_volume = $Panel/music_volume.value
	var music_enable = $Panel/music_on.pressed
	Settings.set_settings(music_volume, music_enable)
	Settings.save_settings()
	set_settings()
	
func _ready():
	set_settings()
	

func _on_btn_back_pressed():
	queue_free()
	G.sub("menu_pause")
	set_settings()


func _on_btn_default_pressed():
	$Panel/music_on.pressed = Settings.default_settings["options"]["music_enable"]
	$Panel/music_volume.value = Settings.default_settings["options"]["music_volume"]


func _on_music_volume_value_changed(value):
	Settings.bg_music.set_volume_db(value)
	$Panel/music_volume/LabelValue.text = String(value)
