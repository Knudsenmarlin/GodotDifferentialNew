extends MarginContainer

@onready var exprEdit2Scene = preload("res://GUIScenes/InputDiff2.tscn")
@onready var inputPlace = get_node("%InputPlace")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _can_drop_data(at_position, data):
	if Global.hasDroppedExpr2 == true:
		return false
	else:
		return true
	
func _drop_data(at_position, data):
	var exprType2 = str(Calculus.exprType2)
	if exprType2 == data:
		print("yippee")
		var exprEdit2 = exprEdit2Scene.instantiate()
		inputPlace.add_child(exprEdit2)
		Global.hasDroppedExpr2 = true
	else:
		print("WRONG")
