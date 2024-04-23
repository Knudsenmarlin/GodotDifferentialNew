extends CharacterBody2D

@export var SPEED = 0.25
@onready var objective = get_parent().get_node("%Castle")
@onready var objective_position = Vector2(0, 0)
@onready var target_position = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	objective_position = objective.position
	target_position = (objective_position - position).normalized()
	move_and_collide(target_position * SPEED)
	
