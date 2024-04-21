extends Node

var expr1 = ""
var expr2 = ""
var name1 = ""
var function1 = ""
var listOfFunction = ["k", "x^n", "x^-1", "ln(x)", "e^x", "e^k*x", "k*x", "k^x", "cos(x)", "sin(x)", "-cos(x)", "-sin(x)"]
var dictOfFunction = {
	"f(x)": "f'(x)",
	"k": "0",
	"x^n": "n*x^(n-1)",
	"x^-1": "-x^-2",
	"ln(x)": "1/x",
	"e^x": "e^x",
	"e^k*x": "k*e^(k*x)",
	"k*x": "k",
	"k^x": "ln(a)*a^x",
	"cos(x)": "-sin(x)",
	"sin(x)": "cos(x)",
	"-cos(x)": "sin(x)",
	"-sin(x)": "-cos(x)"
}
var dictRule = {
	"Chain rule" = "f'(g(x))*g'(x)",
	"Quotient rule" = "(g(x)*f'(x)-f(x)*g^(x))/(g(x))^2",
	"Product rule" = "f'(x)*g(x)+f(x)*g'(x)"
}

func _generate_function(expr: String):
	expr1 = str(expr)
	expr2 = str(dictOfFunction[expr])

func _generate_rule(rule: String):
	name1 = str(rule)
	function1 = str(dictRule[rule])
	
