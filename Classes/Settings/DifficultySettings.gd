extends "res://Classes/Settings/BaseSettings.gd"

var ChildDifficultyValue = {"actual": 1, "default": 1} #определить значения сложности какие необходимо

func apply(type = "actual"):
	print("применение настроек сложности")
	G.KnifeTargetObject.settingsRotateVelocity = G.KnifeTargetObject.defaultRotateVelocity * ChildDifficultyValue[type]
	#реализовать замену значения переменной rotateVelocity в Cylinder.gd (подсмотреть пример можно в MusicSettings)
