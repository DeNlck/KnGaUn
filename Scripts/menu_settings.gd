extends Control


#func set_settings():
#	$Panel/music_on.pressed = Settings.settings["options"]["music_enable"]
#	$Panel/music_volume.value = Settings.settings["options"]["music_volume"]
#	Settings.bg_music.set_volume_db($Panel/music_volume.value)
#	if Settings.bg_music.volume_db < -23:
#		Settings.bg_music.set_volume_db(-80)

	
	
func _on_btn_save_pressed():
#	var music_volume = $Panel/music_volume.value
#	var music_enable = $Panel/music_on.pressed
	Settings.save_settings() #метод базового класса, который сохранит каждого потомка в общий словарь настроек а затем в json
	Settings.set_settings() #полиморфный метод устанавливающий применение настроек каждой зоны
	
func _ready():
	Settings.set_settings() #в момент инициализации применяет текущие настройки которые были
	

func _on_btn_back_pressed():
	queue_free()
	G.sub("menu_pause")
	Settings.set_settings() #таким же образом применяет текущие настройки при покидании окна настроек без сохранения


func _on_btn_default_pressed():
	pass #нужно вызвать базовый метод который применит default настройки (модифицировать save_settings("default"))
	#$Panel/music_on.pressed = Settings.default_settings["options"]["music_enable"]
	#$Panel/music_volume.value = Settings.default_settings["options"]["music_volume"]


func _on_music_volume_value_changed(value):
	Settings.SettingsArea["MusicSettings"].set_property("ChildMusicVolume", value)
	Settings.SettingsArea["MusicSettings"].apply()


func _on_music_on_toggled(button_pressed):
	Settings.SettingsArea["MusicSettings"].set_property("ChildMusicEnable", button_pressed)
	Settings.SettingsArea["MusicSettings"].apply()
