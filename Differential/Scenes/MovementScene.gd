extends Node2D

@onready var player = preload("res://Scenes/PlayerScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance = player.instantiate()
	add_child(playerInstance)
	print(Calculus._expression_generator())
	

