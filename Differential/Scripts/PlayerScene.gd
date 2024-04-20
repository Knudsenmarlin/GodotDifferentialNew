extends CharacterBody2D


const SPEED = 600.0
const ACCEL = 8.0
var dir = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	var mousePos = get_global_mouse_position() 
	var localMousePos = get_local_mouse_position()
	look_at(mousePos)
	$Camera2D.position = localMousePos / 5
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	dir = dir.normalized()
	velocity = lerp(velocity, dir * SPEED, delta * ACCEL)
	
	move_and_slide()
	if Input.is_action_just_pressed("left_click"):
			$AnimationPlayer.play("Slash")
		
		

