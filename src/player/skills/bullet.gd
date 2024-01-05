extends Area2D

var direction: Vector2
const SPEED: int = 8

const DAMAGE: int = 20


func set_parameters(direction: Vector2, position: Vector2):
	self.direction = direction
	self.position = position
	$AnimatedSprite2D.rotation += direction.angle()


func _physics_process(delta):
	position += direction * SPEED


func _on_colliding_with_enemy(body: PhysicsBody2D):
	body.take_damage(DAMAGE)
	queue_free()


func _on_colliding_with_map(body: TileMap):
	queue_free()
