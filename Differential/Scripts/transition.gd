extends CanvasLayer


func change_scene(target: String) -> void:
	get_tree().paused = true
	$transition.play('dissolve')
	await $transition.animation_finished
	get_tree().change_scene_to_file(target)
	$transition.play_backwards('dissolve')
	get_tree().paused = false

func change_scene_manually() -> void:
	get_tree().paused = true
	$transition.play('dissolve')
	await $transition.animation_finished
	$transition.play_backwards('dissolve')
	get_tree().paused = false
