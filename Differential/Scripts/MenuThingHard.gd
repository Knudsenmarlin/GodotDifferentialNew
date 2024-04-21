extends MarginContainer

@onready var name1 = get_node("VBoxContainer/Name")
@onready var expr = get_node("VBoxContainer/expr")
# Called when the node enters the scene tree for the first time.
func _ready():
	name1.text = Global.name1
	expr.text = Global.function1

func _on_mouse_entered():
	var tween = create_tween()
	tween.tween_property($BG, "color", Color.hex(0x69809e64), 0.3).set_trans(Tween.TRANS_SINE)
	

func _on_mouse_exited():
	var tween = create_tween()
	tween.tween_property($BG, "color", Color.hex(0x69809e00), 0.3).set_trans(Tween.TRANS_SINE)
