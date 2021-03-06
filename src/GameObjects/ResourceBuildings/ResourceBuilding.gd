extends GameBuilding

export (Enums.resource_types) var resource_type = Enums.resource_types.EXCEPTION
export var resource_amt := -1

func _ready() -> void:
	Signals.connect("day_passed", self, "_on_day_passed")

	is_defense_building = false
	is_resource_building = true

func _on_day_passed(day: int):
	if active:
		assert(resource_type != Enums.resource_types.EXCEPTION)
		assert(resource_amt != -1)

		if(resource_type == Enums.resource_types.science):
			PlayersManager.players[player_num - 1].tech_research_progress += resource_amt
			PlayersManager.players[player_num - 1].check_research_complete()

		var rng = RandomNumberGenerator.new()
		rng.randomize()
		if rng.randi_range(0, 10) > 7:
			PlayersManager.whoami().add_score_value(resource_amt)

		var resource_info = [resource_type, resource_amt]
		Signals.emit_signal("resource_generated", player_num, resource_info)
