extends Node

var game = null
var mode = null
var on_tv_enter = false
var camera_in_gamezone = false

# Переменные для хранения объектов, которые задействованы на сцене в данный момент времени
var KnifeTargetObject
var MeleeWeaponObject


func _ready():
	OS.center_window()

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		set_pause()
	if Input.is_action_just_pressed("ui_accept"): #ДЕБАГОВАЯ ФУНКЦИЯ НА ПРОБЕЛ
		debug_log()

func pause(s=1):
	get_tree().paused = bool(s)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if s else Input.MOUSE_MODE_VISIBLE) #отображение курсора мыши на паузе

func sub(scene):
	var n = load("res://Scenes/"+scene+".tscn").instance()
	print(n)
	game.add_child(n)

func is_paused():
	if get_tree().paused:
		print("Поставили на паузу")
	else:
		print("Вернулись в игру")

func set_pause():
	pause()
	is_paused()
	sub("menu_pause")

func resume_game():
	pause(0)
#	print(game.get_node("world/path_to_knives/path_follow").name)
	is_paused()

func open_settings():
	sub("menu_settings")

func debug_log(): #ВСЕ ЧТО ПОТРЕБУЕТСЯ ДЛЯ ОТСЛЕЖИВАНИЯ В КОНСОЛИ ПО КНОПКЕ
#	print("ИГРАЕТ ЛИ МУЗЫКА: ",Settings.bg_music.stream_paused)
#	print("УРОВЕНЬ: ",Settings.bg_music.volume_db)
	pass

