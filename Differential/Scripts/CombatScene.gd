extends Node2D

var host_url = "http://127.0.0.1:5000"
@onready var http_request = $HTTPRequest
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var finalData = Calculus._expression_generator()
	var data = finalData[0]
	var exprText1 = finalData[0]['expr1']
	var exprType1 = finalData[1]['exprType1']
	var exprText1Label = get_node("%expr1")
	exprText1Label.text = exprText1
	
	var exprText2 = finalData[0]['expr2']
	var exprType2 = finalData[1]['exprType2']
	var exprText2Label = get_node("%expr2")
	exprText2Label.text = exprText2
	
	_http_request(data, "/diff")
	

func _http_request(data, request_destination): 
	var json = JSON.stringify(data)
	print(data)
	var headers = ["Content-Type: application/json"]
	http_request.request(host_url + request_destination, headers, HTTPClient.METHOD_POST, json)
	print("sent request")
	

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	#attempting to make a HTTPRequest function
	if response_code == 200:
		print("Request was successful")
		var json = JSON.parse_string(body.get_string_from_utf8())
		print(json)
		Calculus.diffExpr1 = json['diffExpr1']
		Calculus.diffExpr2 = json['diffExpr2']
		
	else:
		print("request failed")
