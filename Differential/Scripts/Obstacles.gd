extends StaticBody2D

@onready var shape = $Shape
@onready var collision = $Collision
# Called when the node enters the scene tree for the first time.
func _ready():
	collision.polygon = shape.polygon

