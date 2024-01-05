extends Resource
class_name Saver

const SAVE_GAME_PATH = "user://data.tres"

@export var player_position: Vector2
@export var enemy_positions: Array[Vector2]


func save_data(player_position: Vector2, enemy_positions: Array[Vector2]):
	self.player_position = player_position
	self.enemy_positions = enemy_positions
	ResourceSaver.save(self, SAVE_GAME_PATH)


static func load_data() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
