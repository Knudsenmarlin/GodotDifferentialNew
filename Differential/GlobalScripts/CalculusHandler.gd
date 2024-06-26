extends Node

var exprType1 = ""
var exprType2 = ""
var expr1 = ""
var expr2 = ""
var diffExpr1 = ""
var diffExpr2 = ""


var dictExpr = {}
var dictExprHard = {}
var dictExprType = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _expression_translate():
	var rng = RandomNumberGenerator.new()
	var expression1 = ""
	var exprList = ["k", "x^n", "x^-1", "ln(x)", "e^x", "e^k*x", "k*x", "k^x", "cos(x)", "sin(x)", "-cos(x)", "-sin(x)"]
	expression1 = exprList[rng.randi_range(0, exprList.size()-1)]
	var exprType = expression1
	match(expression1):
		"k":
			expression1 = str(rng.randi_range(1, 9))
		"x^n":
			expression1 = "x^" + str(rng.randi_range(2, 9))
		"e^k*x":
			expression1 = "exp(" + str(rng.randi_range(2, 9)) + "*x)"
		"k*x":
			expression1 = str(rng.randi_range(1, 9)) + "*x"
		"k^x":
			expression1 = str(rng.randi_range(1, 9)) + "^x"
		"e^x":
			expression1 = "exp(x)"
		_:
			pass
	var finalData = [str(expression1), exprType]
	return finalData

func _expression_generator():
	var data1 = _expression_translate()
	expr1 = data1[0]
	exprType1 = data1[1]
	var data2 = _expression_translate()
	expr2 = data2[0]
	exprType2 = data2[1]
	dictExpr = {
		'expr1': str(expr1),
		'expr2': str(expr2)
	}
	dictExprType = {
		'exprType1' = str(exprType1),
		'exprType2' = str(exprType2)
	}
	return [dictExpr, dictExprType]


func _expression_hard_translate():
	var rng = RandomNumberGenerator.new()
	var expression1 = ""
	var exprList = ["x^n", "x^-1", "ln(x)", "e^x", "e^k*x", "k*x", "k^x", "cos(x)", "sin(x)", "-cos(x)", "-sin(x)"]
	expression1 = exprList[rng.randi_range(0, exprList.size()-1)]
	match(expression1):
		"k":
			expression1 = str(rng.randi_range(1, 9))
		"x^n":
			expression1 = "x^" + str(rng.randi_range(2, 9))
		"e^k*x":
			expression1 = "exp(" + str(rng.randi_range(1, 9)) + "*x)"
		"k*x":
			expression1 = str(rng.randi_range(1, 9)) + "*x"
		"k^x":
			expression1 = str(rng.randi_range(1, 9)) + "^x"
		"e^x":
			expression1 = "exp(x)"
		_:
			pass
	return str(expression1)


func _expression_generator_hard():
	var rng = RandomNumberGenerator.new()
	var exprHard = ""
	var exprFormatChain = ["sin(a)", "cos(a)", "(kx+b)^k", "ln(a)"]
	var exprFormatProduct = "a*b"
	var exprFormatQuotient = "a/b"
	var exprFormatType = ["Chain", "Product", "Quotient"]
	var exprHardType = str(exprFormatType[rng.randi_range(0, 2)])
	match(exprHardType):
		"Chain":
			exprHard = exprFormatChain[rng.randi_range(0, exprFormatChain.size()-1)]
			match(exprHard):
				"sin(a)":
					exprHard = "sin(" + _expression_hard_translate() + ")"
				"cos(a)":
					exprHard = "cos(" + _expression_hard_translate() + ")"
				"(kx+b)^k":
					exprHard = "(" + str(rng.randi_range(1, 9)) + "x+" + str(rng.randi_range(1, 9)) + ")^" + str(rng.randi_range(1, 9))
				"ln(a)":
					exprHard = "ln(" + _expression_hard_translate() + ")"
				_:
					print("error")
		"Product":
			exprHard = _expression_hard_translate() + "*" + _expression_hard_translate()
		"Quotient":
			exprHard = _expression_hard_translate() + "/" + _expression_hard_translate()
		_:
			print("error")
	dictExprHard = {
		'exprHard': str(exprHard)
	}
	return dictExprHard
