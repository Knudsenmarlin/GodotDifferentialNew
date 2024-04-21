extends MarginContainer

@onready var function1 = get_node("HBoxContainer/f(x)")
@onready var function2 = get_node("HBoxContainer/f'(x)")
# Called when the node enters the scene tree for the first time.
func _ready():
	function1.text = Global.expr1
	function2.text = Global.expr2
	
	

func _on_mouse_entered():
	$BG.color = Color.hex(0x69809e64)

func _on_mouse_exited():
	$BG.color = Color.hex(0x69809e00)
