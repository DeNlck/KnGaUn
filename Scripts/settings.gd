extends Node


#----------------------------------ПОДКЛЮЧЕНИЕ_НАСТРОЕК-----------------------------------
var _BaseSettings = preload("res://Classes/Settings/BaseSettings.gd")
var _MusicSettings = preload("res://Classes/Settings/MusicSettings.gd")
var _DifficultySettings = preload("res://Classes/Settings/DifficultySettings.gd")

var BaseSettings
var SettingsArea = {
	"MusicSettings" : null,
	"DifficultySettings" : null
}
#-----------------------------------------------------------------------------------------


var bg_music
const SETTINGS_FILE = "res://settings.json"
var settings = {}


func _ready(): #ИНИЦИАЛИЗАЦИЯ НАСТРОЕК
	BaseSettings = _BaseSettings.new()
	SettingsArea["MusicSettings"] = _MusicSettings.new()
	SettingsArea["DifficultySettings"] = _DifficultySettings.new()
	load_settings()
	

func load_settings():
	var file = File.new()
	if not file.file_exists(SETTINGS_FILE):
		reset_settings()
		return
	file.open(SETTINGS_FILE, file.READ)
	var text = file.get_as_text()
	settings = parse_json(text)
	file.close()
	
	
func reset_settings():
	#settings = settings_default.duplicate(true)
	pass
	#тут надо задуматься о реализации дефолта
	

func set_settings(type = "actual"):
	for item in SettingsArea:
		SettingsArea[item].apply(type)


func save_settings_to_file():
	var file
	file = File.new()
	file.open(SETTINGS_FILE, File.WRITE)
	file.store_line(to_json(settings))
	file.close()


func update_settings_dictionary(type):
	for item in SettingsArea:
		settings = BaseSettings.merge_dict(settings, SettingsArea[item].collect_child_properties(type))


func save_settings(type = "actual"):
	update_settings_dictionary(type)
	save_settings_to_file()
