extends Node2D

@onready var player = preload("res://Scenes/PlayerScene.tscn")
@onready var enemyDiff = preload("res://Scenes/EnemyDiff.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance = player.instantiate()
	add_child(playerInstance)
	print(Calculus._expression_generator())
	
func _on_timer_timeout():
	var enemyD = enemyDiff.instantiate()
	enemyD.position = Vector2(0, -500)
	add_child(enemyD)
