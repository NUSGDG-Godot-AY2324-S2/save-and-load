extends CharacterBody2D

var last_horizontal_direction: int = 0
var last_vertical_direction: int = 0
var horizontal_direction: int = 0
var vertical_direction: int = 0
const SPEED: int = 180

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var map: TileMap = get_parent().get_node("Map")
@onready var camera: Camera2D = $Camera2D

var can_attack: bool = true
const Bullet = preload("res://player/skills/bullet.tscn")


func _ready():
	_adjust_camera()


func _adjust_camera():
	var rect = map.get_used_rect()
	var cell_size = map.cell_quadrant_size
	camera.limit_left = rect.position.x * cell_size
	camera.limit_right = rect.end.x * cell_size
	camera.limit_top = rect.position.y * cell_size
	camera.limit_bottom = rect.end.y * cell_size


func _physics_process(delta):
	_make_movement()
	_attack()


func _make_movement():
	last_horizontal_direction = horizontal_direction
	last_vertical_direction = vertical_direction
	horizontal_direction = Input.get_action_strength("ui_right") \
		- Input.get_action_strength("ui_left")
	vertical_direction = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = Vector2(horizontal_direction, vertical_direction).normalized() * SPEED
	move_and_slide()


func _attack():
	if not can_attack or not Input.is_action_just_pressed("attack"):
		return
	var bullet = Bullet.instantiate()
	var direction = (get_global_mouse_position() - position).normalized()
	bullet.set_parameters(direction, position)
	get_parent().add_child(bullet)
	$AttackTimer.start()
	can_attack = false


func _on_attack_timer_timeout():
	can_attack = true
