extends "res://Classes/Settings/BaseSettings.gd"

const LOWEST_MUSIC_LEVEL = -24

var ChildMusicVolume = {"actual": 0, "default": -12}
var ChildMusicEnable = {"actual": true, "default": true} 


func set_stream_paused(flag):
	Settings.bg_music.set_stream_paused(flag)

func set_volume_db(value):
	if value == LOWEST_MUSIC_LEVEL:
		set_stream_paused(true)
	else:
		set_stream_paused(false)
		Settings.bg_music.set_volume_db(value)
	
func set_playing(flag):
	# чтобы музыка не начиналась сначала каждый раз, 
	#в случае если она уже играет, а flag == true, трогать ее не будем
	if not (flag and Settings.bg_music.is_playing()):
		Settings.bg_music._set_playing(flag)
	

func apply(type = "actual"):
	var music_volume = ChildMusicVolume[type]
	var is_music_enable = ChildMusicEnable[type]
	set_volume_db(music_volume)
	set_playing(is_music_enable)
	print("применение звуковых настроек")
