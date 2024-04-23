extends StaticBody2D

@onready var castle = $Castle
@onready var collision = $CollisionPolygon2D
# Called when the node enters the scene tree for the first time.
func _ready():
	collision.polygon = castle.polygon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		Global.hp -= 25
		print(Global.hp)
