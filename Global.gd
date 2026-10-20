extends Node

var current_user: String = ""
var current_pass: String = ""
var current_level: int = 1
var current_money: int = 0
var current_team: String = ""

# Database
var saved_accounts = {}

func check_login(user, pword):
	if saved_accounts.has(user) and saved_accounts[user]["password"] == pword:
		current_user = user
		current_level = saved_accounts[user]["lvl"]
		current_money = saved_accounts[user]["money"]
		return true
	return false

func register_account(user, pword):
	if not saved_accounts.has(user):
		if user == "Prince":
			saved_accounts[user] = {"password": pword, "lvl": 2450, "money": 99999999}
		else:
			saved_accounts[user] = {"password": pword, "lvl": 1, "money": 0}
		return true
	return false
