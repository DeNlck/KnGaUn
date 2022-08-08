extends Node

func _ready():
	G.game = self
	Settings.bg_music = BgMusic.get_node("AudioStreamPlayer")
	
