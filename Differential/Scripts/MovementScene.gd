extends Node2D

@onready var player = preload("res://Scenes/PlayerScene.tscn")
@onready var enemyDiff = preload("res://Scenes/EnemyDiff.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerInstance = player.instantiate()
	add_child(playerInstance)
	
func _on_timer_timeout():
	var enemyD = enemyDiff.instantiate()
	var rng = RandomNumberGenerator.new()
	var spawn = "EnemyHandler/spawnpoint" + str(rng.randi_range(1, get_tree().get_nodes_in_group("spawn").size()))
	var area = get_node(spawn)
	var pos = area.position + Vector2(rng.randf() * area.size.x, rng.randf() * area.size.y)
	var spawnPoint = get_node("EnemyHandler/spawn")
	spawnPoint.position = pos
	enemyD.position = spawnPoint.position
	get_node("EnemyHandler").add_child(enemyD)
	$Timer.wait_time = Global.wait
