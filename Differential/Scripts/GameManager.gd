extends Node

var movementScene = preload("res://Scenes/MovementScene.tscn")
var gameOver = "res://GUIScenes/GameOver.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	var move = movementScene.instantiate()
	add_child(move)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("CanvasLayer/Control/HP").text = "HP:" + str(Global.hp)
	if Global.hp < 1:
		SceneTransition.change_scene(gameOver)
