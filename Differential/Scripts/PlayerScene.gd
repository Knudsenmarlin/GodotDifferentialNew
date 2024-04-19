extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_up := Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	if direction_up:
		velocity.y = direction_up * SPEED
	else:
		velocity.y = 0

	move_and_slide()
