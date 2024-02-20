@tool
extends Node2D

@export var color: Color
@export var icon: Texture
@export var icon_scale: float = 1
@export var loss: float = 0
var icon_offset = Vector2(-145, -15)
var value = 100

func _ready():
	get_node("Bar").modulate = color
	if not icon == null: 
		get_node("Icon").texture = load(icon.resource_path)
		get_node("Icon").position = icon_offset
		get_node("Icon").scale = Vector2(icon_scale, icon_scale)

func _process(delta):
	if not Engine.is_editor_hint():
		value = max(0, value - loss)
		get_node("Label").text = str(value) + "/100"
	if Engine.is_editor_hint():
		get_node("Bar").modulate = color
		if not icon == null: 
			get_node("Icon").texture = load(icon.resource_path)
			get_node("Icon").global_position = position + icon_offset
			get_node("Icon").scale = Vector2(icon_scale, icon_scale)
