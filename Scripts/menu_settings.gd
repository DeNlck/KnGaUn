extends Control


func set_settings():
	$Panel/music_on.pressed = Settings.settings["options"]["music_enable"]
	$Panel/music_volume.value = Settings.settings["options"]["music_volume"]
	Settings.bg_music.set_volume_db($Panel/music_volume.value)
	

func _ready():
	set_settings()
	

func _on_btn_back_pressed():
	queue_free()
	G.sub("menu_pause")
	set_settings()


func _on_btn_default_pressed():
	$Panel/music_on.pressed = true
	$Panel/music_volume.value = 50


func _on_btn_save_pressed():
	var music_volume = $Panel/music_volume.value
	var music_enable = $Panel/music_on.pressed
	Settings.set_settings(music_volume, music_enable)
	Settings.save_settings()


func _on_music_volume_value_changed(value):
	Settings.bg_music.set_volume_db(value)
	print(Settings.bg_music.volume_db)
