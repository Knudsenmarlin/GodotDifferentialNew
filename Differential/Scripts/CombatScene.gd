extends Node2D

var answer = ""
var host_url = "http://127.0.0.1:5000"
@onready var http_request = $HTTPRequest
var movementScene = "res://Scenes/MovementScene.tscn"

func _process(delta: float) -> void:
	get_node("%expr1Answer").text = Global.input1
	get_node("%expr2Answer").text = Global.input2
	get_node("CanvasLayer/Control/Panel/Label").text = "HP:" + str(Global.hp)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var finalData = await Calculus._expression_generator()
	var data = finalData[0]
	var exprText1 = finalData[0]['expr1']
	var exprType1 = finalData[1]['exprType1']
	var exprText2 = finalData[0]['expr2']
	var exprType2 = finalData[1]['exprType2']
	
	_http_request(data, "/diff")
	await $HTTPRequest.request_completed
	if "exp" in exprText1:
		exprText1 = replace_exp_with_e_power_x(exprText1)
	if "exp" in exprText2:
		exprText2 = replace_exp_with_e_power_x(exprText2)
	var exprText1Label = get_node("%expr1")
	var exprText2Label = get_node("%expr2")
	exprText1Label.text = exprText1
	exprText2Label.text = exprText2

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
		if json.has("diffExpr1"):
			Calculus.diffExpr1 = json['diffExpr1']
			Calculus.diffExpr2 = json['diffExpr2']
		if json.has("answer"):
			answer = json["answer"]
	else:
		print("request failed")

func replace_exp_with_e_power_x(input_string: String) -> String:
	var pattern = "exp\\((.*?)\\)"
	var regex = RegEx.new()
	regex.compile(pattern)
	
	var replaced_string = regex.sub(input_string, "e^($1)")
	
	return replaced_string


func _on_check_button_up() -> void:
	var sendData = {
		'diffInput1' = Global.input1,
		'diffInput2' = Global.input2,
		'diffExpr1' = Calculus.diffExpr1,
		'diffExpr2' = Calculus.diffExpr2
	}
	_http_request(sendData, "/diffCheck")
	await $HTTPRequest.request_completed
	match(answer):
		"success":
			print("yippee")
			var movementScene = get_tree().current_scene.get_node("MovementScene")
			process_mode = Node.PROCESS_MODE_DISABLED
			await SceneTransition.change_scene_manually()
			Calculus.diffExpr1 = ""
			Calculus.diffExpr2 = ""
			Global.input1 = ""
			Global.input2 = ""
			Global.hasDroppedExpr1 = false
			Global.hasDroppedExpr2 = false
			movementScene.visible = true
			movementScene.process_mode = movementScene.PROCESS_MODE_INHERIT
			queue_free()
			Global.hp += 25
			Global.score += 1
		"failed":
			print("failed")
			Global.hp -= 25


func _on_timer_timeout() -> void:
	Global.hp -= 1
