extends Node3D

@onready var chat_input = $UI/ChatBox/ChatInput
@onready var chat_send = $UI/ChatBox/SendBtn
@onready var player = $Player

func _ready():
	chat_send.pressed.connect(_on_chat_send)
	chat_input.text_submitted.connect(func(_t): _on_chat_send())

func _on_chat_send():
	var msg = chat_input.text.strip_edges()
	chat_input.text = ""
	if msg == "": return
	
	if msg.begins_with("/"):
		_handle_admin_command(msg)
	else:
		print(Global.current_user + ": " + msg)

func _handle_admin_command(cmd_text):
	var parts = cmd_text.split(" ")
	var cmd = parts[0]
	
	if cmd == "/g":
		print("ADMIN: Gave item ", parts[1])
	elif cmd == "/lvl":
		print("ADMIN: Set level to ", parts[1])
	elif cmd == "/tp":
		print("ADMIN: Teleported to ", parts[1])
	elif cmd == "/br":
		print("ADMIN: Brought ", parts[1], " to me")
