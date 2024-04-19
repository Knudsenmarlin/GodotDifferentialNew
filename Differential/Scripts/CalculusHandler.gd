extends Node

var dictExpr = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass


func _expression_generator():
	var rng = RandomNumberGenerator.new()
	var expression1 = ""
	var expression2 = ""
	var exprList = ["k", "x^n", "x^-1", "ln(x)", "e^x", "e^k*x", "k*x", "k^x", "cos(x)", "sin(x)", "-cos(x)"]
	var randomNumber1 = rng.randi_range(0, exprList.size())
	var randomNumber2 = rng.randi_range(0, exprList.size())
	expression1 = exprList[randomNumber1-1]
	match(expression1):
		"k":
			expression1 = str(rng.randi_range(0, 9))
		"x^n":
			expression1 = "x^" + str(rng.randi_range(0, 9))
		"e^k*x":
			expression1 = "exp(" + str(rng.randi_range(0, 9)) + "*x)"
		"k*x":
			expression1 = str(rng.randi_range(0, 9)) + "*x"
		"k^x":
			expression1 = str(rng.randi_range(0, 9)) + "**x"
		"e^x":
			expression1 = "exp(x)"
		_:
			pass
	expression2 = exprList[randomNumber2-1]
	match(expression2):
		"k":
			expression2 = str(rng.randi_range(0, 9))
		"x^n":
			expression2 = "x^" + str(rng.randi_range(0, 9))
		"e^k*x":
			expression2 = "exp(" + str(rng.randi_range(0, 9)) + "*x)"
		"k*x":
			expression2 = str(rng.randi_range(0, 9)) + "*x"
		"k^x":
			expression2 = str(rng.randi_range(0, 9)) + "**x"
		"e^x":
			expression2 = "exp(x)"
		_:
			pass
	dictExpr = {
		'expr1': str(expression1),
		'expr2': str(expression2)
	}
	
	return dictExpr
	
