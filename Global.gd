extends Node

# Player Data
var current_user: String = ""
var current_pass: String = ""
var current_level: int = 1
var current_money: int = 0
var current_team: String = ""

# The database starts EMPTY. It will save your account when you register.
var saved_accounts = {}

func check_login(user, pass):
	if saved_accounts.has(user):
		if saved_accounts[user]["pass"] == pass:
			current_user = user
			current_level = saved_accounts[user]["lvl"]
			current_money = saved_accounts[user]["money"]
			return true
	return false

func register_account(user, pass):
	if not saved_accounts.has(user):
		# If you are Prince, you get instant max level. Others start at 1.
		if user == "Prince":
			saved_accounts[user] = {"pass": pass, "lvl": 2450, "money": 99999999}
		else:
			saved_accounts[user] = {"pass": pass, "lvl": 1, "money": 0}
		return true
	return false
