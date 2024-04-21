extends MarginContainer

@onready var function1 = get_node("HBoxContainer/f(x)")
@onready var function2 = get_node("HBoxContainer/f'(x)")
@onready var dragData = preload("res://GUIScenes/DragText.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	function1.text = Global.expr1
	function2.text = Global.expr2
	
	


func _on_mouse_entered():
	var tween = create_tween()
	tween.tween_property($BG, "color", Color.hex(0x69809e64), 0.3).set_trans(Tween.TRANS_SINE)

func _on_mouse_exited():
	var tween = create_tween()
	tween.tween_property($BG, "color", Color.hex(0x69809e00), 0.3).set_trans(Tween.TRANS_SINE)

func _get_drag_data(at_position):
	var data = str(function1.text)
	
	var dragPreview = dragData.instantiate()
	dragPreview.text = function1.text
	add_child(dragPreview)
	
	return data
	
