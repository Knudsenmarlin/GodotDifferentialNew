extends MarginContainer

@onready var exprEdit1Scene = preload("res://GUIScenes/InputDiff1.tscn")
@onready var inputPlace = get_node("%InputPlace")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _can_drop_data(at_position, data):
	return true

func _drop_data(at_position, data):
	var exprType1 = str(Calculus.exprType1)
	if exprType1 == data:
		print("yippee")
		var exprEdit1 = exprEdit1Scene.instantiate()
		inputPlace.add_child(exprEdit1)
	else:
		print("fml")
	
