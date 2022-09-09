extends "res://Classes/Settings/BaseSettings.gd"

const LOWEST_MUSIC_LEVEL = -24

var ChildMusicVolume = {"actual": 0, "default": -12}
var ChildMusicEnable = {"actual": true, "default": true} 


func apply(type = "actual"):
	var music_volume = ChildMusicVolume[type]
	var is_music_enable = ChildMusicEnable[type]
	if music_volume == LOWEST_MUSIC_LEVEL:
		Settings.bg_music.set_stream_paused(true)
	else:
		Settings.bg_music.set_stream_paused(false)
		Settings.bg_music.set_volume_db(music_volume)
	if not (is_music_enable and Settings.bg_music.is_playing()):
		Settings.bg_music._set_playing(is_music_enable)
	print("применение звуковых настроек")
