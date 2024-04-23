extends Button

var movement = preload("res://Scenes/MovementScene.tscn")
var gameManager = preload("res://Scenes/GameManager.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_up():
	SceneTransition.change_scene("res://Scenes/GameManager.tscn")
