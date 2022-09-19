extends Control



func collect_interface_values(): #сборщик значений с gui
	Settings.SettingsArea["MusicSettings"].set_property("ChildMusicVolume", $"Panel/music_volume".value)
	Settings.SettingsArea["MusicSettings"].set_property("ChildMusicEnable", $"Panel/music_on".pressed)
	Settings.SettingsArea["DifficultySettings"].set_property("ChildDifficultyValue", $"Panel/music_difficult".value)

	Settings.SettingsArea["MusicSettings"].apply()
	Settings.SettingsArea["DifficultySettings"].apply()
	
	#задуматься о третьем ключе дочерней сущности настроек - temp, иначе это не dry, и нифига не масштабируемо
	#либо о свойстве реализованном в родителе, указывающем путь до элемента gui с которым он будет всегда единым методом
	#полиморфно взаимодействовать

func set_interface_values(type = "actual"): #проставляет значения на gui
	$"Panel/music_volume".value = Settings.SettingsArea["MusicSettings"].get_property("ChildMusicVolume", type)
	$"Panel/music_on".pressed = Settings.SettingsArea["MusicSettings"].get_property("ChildMusicEnable", type)
	$"Panel/music_difficult".value = Settings.SettingsArea["DifficultySettings"].get_property("ChildDifficultyValue", type)

func _on_btn_save_pressed():
	collect_interface_values()
	Settings.save_settings() #метод базового класса, который сохранит каждого потомка в общий словарь настроек а затем в json
	Settings.set_settings() #полиморфный метод устанавливающий применение настроек каждой зоны
	
func _ready():
	Settings.set_settings() #в момент инициализации применяет текущие настройки которые были
	set_interface_values()
	


func _on_btn_back_pressed():
	queue_free()
	G.sub("menu_pause")
	Settings.set_settings() #таким же образом применяет текущие настройки при покидании окна настроек без сохранения


func _on_btn_default_pressed():
	Settings.update_settings_dictionary("default")
	Settings.set_settings("default")
	set_interface_values("default")


func _on_music_volume_value_changed(value):
	Settings.SettingsArea["MusicSettings"].set_volume_db(value)


func _on_music_on_toggled(button_pressed):
	Settings.SettingsArea["MusicSettings"].set_playing(button_pressed)

