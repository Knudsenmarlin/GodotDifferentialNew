extends CharacterBody2D

var combatScene = preload("res://Scenes/CombatScene.tscn")
const SPEED = 600.0
const ACCEL = 8.0
var dir = Vector2(0, 0)


func _physics_process(delta: float) -> void:
	$PlayerCamera.enabled = true
	var mousePos = get_global_mouse_position() 
	var localMousePos = get_local_mouse_position()
	look_at(mousePos)
	$PlayerCamera.position = localMousePos / 5
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	dir = dir.normalized()
	velocity = lerp(velocity, dir * SPEED, delta * ACCEL)
	
	move_and_slide()
	if Input.is_action_just_pressed("left_click"):
			$AnimationPlayer.play("Slash")
			
func _on_weapon_body_entered(body):
	if body.is_in_group("Enemy"):
		var movementScene = get_tree().current_scene.get_node("MovementScene")
		movementScene.process_mode = movementScene.PROCESS_MODE_DISABLED
		body.queue_free()
		get_node("%WeaponCollision").disabled = true
		await SceneTransition.change_scene_manually()
		var combat = combatScene.instantiate()
		get_tree().current_scene.add_child(combat)
		movementScene.visible = false
		$PlayerCamera.enabled = false
		
