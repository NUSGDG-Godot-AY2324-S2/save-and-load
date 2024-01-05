extends Node2D

var saver: Saver
const Enemy = preload("res://enemy/enemy.tscn")


func _ready():
	saver = Saver.load_data()
	if saver == null:
		saver = Saver.new()
		save_data()
	else:
		apply_data()


func apply_data():
	$Player.position = saver.player_position
	for child in get_tree().get_nodes_in_group("Enemy"):
		child.queue_free()
	for enemy_position in saver.enemy_positions:
		var enemy = Enemy.instantiate()
		enemy.position = enemy_position
		add_child(enemy)


func _physics_process(delta):
	if Input.is_action_just_pressed("save"):
		save_data()


func save_data():
	var player_position: Vector2 = _get_player_position()
	var enemy_positions: Array[Vector2] = _get_enemy_positions()
	saver.save_data(player_position, enemy_positions)


func _get_player_position() -> Vector2:
	return $Player.position


func _get_enemy_positions() -> Array[Vector2]:
	var positions: Array[Vector2] = []
	for child in get_tree().get_nodes_in_group("Enemy"):
		positions.append(child.position)
	return positions
