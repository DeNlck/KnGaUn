extends Node


#----------------------------------ПОДКЛЮЧЕНИЕ_НАСТРОЕК-----------------------------------
var _GlobalSettings = preload("res://Classes/Settings/GlobalSettings.gd")
var _MusicSettings = preload("res://Classes/Settings/MusicSettings.gd")
var _GraphicSettings = preload("res://Classes/Settings/GraphicSettings.gd")

var GlobalSettings
var SettingsArea = {
	"MusicSettings" : null,
	"GraphicSettings" : null
}
#-----------------------------------------------------------------------------------------

var bg_music
var settings_file = "res://settings.json"
var settings = {}
var default_settings = {
	"options":
		{
			"music_volume": -12,
			"music_enable": true
		}
}
var test_settings = {}


func _ready():
	GlobalSettings = _GlobalSettings.new()
	SettingsArea["MusicSettings"] = _MusicSettings.new()
	SettingsArea["GraphicSettings"] = _GraphicSettings.new()
	load_settings()
	

func load_settings():
	var file = File.new()
	if not file.file_exists(settings_file):
		reset_settings()
		return
	file.open(settings_file, file.READ)
	var text = file.get_as_text()
	settings = parse_json(text)
	file.close()
	
	
func reset_settings():
	settings = default_settings.duplicate(true)
	

func set_settings(music_volume, music_enable):
	settings["options"]["music_volume"] = music_volume
	settings["options"]["music_enable"] = music_enable


func save_settings():
	var file
	file = File.new()
	file.open(settings_file, File.WRITE)
	file.store_line(to_json(settings))
	file.close()


func collect_general_settings_dict(dest, source):
	for key in source:
		var obj = source[key]
		dest = GlobalSettings.merge_dict(dest, obj.collect_child_properties())
	return dest
		
