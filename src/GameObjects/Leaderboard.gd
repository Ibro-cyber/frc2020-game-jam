extends Control

var players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5"]

func _ready():
	
	var font = DynamicFont.new()
	font.set_font_data(load("res://assets/TechTreeFont.ttf"))
	font.set_size(28)
	
	for i in range (1, 6):
		get_node(node_path(i) + "/Name").add_font_override("font", font)
		get_node(node_path(i) + "/Score").add_font_override("font", font)
		get_node(node_path(i) + "/Raw").add_font_override("font", font)
		get_node(node_path(i) + "/Science").add_font_override("font", font)
		get_node(node_path(i) + "/Power").add_font_override("font", font)
	
	pass

func on_show():
	for i in range (1, 6):
		update_player_data(i)
	set_leaderboard_rows()
	pass
	
func update_player_data(num: int):
	var p = PlayersManager.get_player(num)
	
	var stat = [p.name, p.score, p.resources[Enums.resource_types.raw], p.resources[Enums.resource_types.power], p.resources[Enums.resource_types.science]]
	players[num - 1] = stat
	pass

func set_leaderboard_rows():
	var node = ""
	for i in range (1, 6):
		get_node(node_path(i) + "/Name").set_text(str(players[i - 1][0]))
		get_node(node_path(i) + "/Score").set_text("Score: " + str(players[i - 1][1]))
		get_node(node_path(i) + "/Raw").set_text("Raw: " + str(players[i - 1][2]))
		get_node(node_path(i) + "/Science").set_text("Science: " + str(players[i - 1][3]))
		get_node(node_path(i) + "/Power").set_text("Power: " + str(players[i - 1][4]))
	pass

func node_path(i: int):
	return "Background/Leaderboard/Player" + str(i) + "/Stats"
