extends VBoxContainer

@onready var function = preload("res://GUIScenes/MenuThing.tscn")
@onready var seperator = preload("res://GUIScenes/Seperator.tscn")
@onready var rules = preload("res://GUIScenes/MenuThingHard.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, Global.listOfFunction.size()):
		var seperate = seperator.instantiate()
		var menu = function.instantiate()
		Global._generate_function(Global.listOfFunction[i])
		add_child(menu)
		add_child(seperate)
	for i in Global.dictRule:
		var menu = rules.instantiate()
		var seperate = seperator.instantiate()
		Global._generate_rule(i)
		add_child(menu)
		add_child(seperate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
