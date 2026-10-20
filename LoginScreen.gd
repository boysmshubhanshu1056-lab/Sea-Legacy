extends Control

@onready var user_input = $VBoxContainer/UsernameInput
@onready var pass_input = $VBoxContainer/PasswordInput
@onready var login_btn = $VBoxContainer/LoginButton
@onready var error_label = $VBoxContainer/ErrorLabel

func _ready():
	pass_input.secret = true
	login_btn.pressed.connect(_on_login_pressed)
	error_label.text = ""

func _on_login_pressed():
	var u = user_input.text.strip_edges()
	var p = pass_input.text.strip_edges()
	
	if u == "" or p == "":
		error_label.text = "Please fill in both fields."
		return
		
	# Try to login
	if Global.check_login(u, p):
		error_label.text = "Welcome back, " + u + "!"
		await get_tree().create_timer(1.0).timeout
		error_label.text = "Login successful! Next: Team Select."
	else:
		# If login fails, try to register a new account
		if Global.register_account(u, p):
			error_label.text = "Account created! Logging in..."
			Global.check_login(u, p)
			await get_tree().create_timer(1.0).timeout
			error_label.text = "Account created! Next: Team Select."
		else:
			error_label.text = "Wrong password for this user."
