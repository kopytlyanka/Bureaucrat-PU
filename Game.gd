extends Node2D

var cash = 50

func _ready():
	get_node("Label").text = str(cash) + "$"
