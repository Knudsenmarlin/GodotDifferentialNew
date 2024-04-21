extends MarginContainer

@onready var name1 = get_node("VBoxContainer/Name")
@onready var expr = get_node("VBoxContainer/expr")
# Called when the node enters the scene tree for the first time.
func _ready():
	name1.text = Global.name1
	expr.text = Global.function1





func _on_mouse_entered():
	$BG.color = Color.hex(0x69809e64)


func _on_mouse_exited():
	$BG.color = Color.hex(0x69809e00)
