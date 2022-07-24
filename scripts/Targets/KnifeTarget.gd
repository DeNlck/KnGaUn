class_name KnifeTarget

var hp: int
var isTouched: bool = false
var privateVar:int setget setPrivatevar, getPrivatevar

func _init(_hp:int = 5):
	hp = _hp
	pass

func say(arg):
	print(arg)

func setPrivatevar(arg:int):
	printerr(arg)
	push_warning("test warning")
	return

func getPrivatevar():
	return privateVar
