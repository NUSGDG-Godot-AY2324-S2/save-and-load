extends CharacterBody2D

const MAX_HEALTH: int = 100
var health: int = MAX_HEALTH


func take_damage(damage: int):
	health -= damage
	if health < 0:
		die()
		return
	$AnimatedSprite2D.play("hit")
	$HitTimer.start()


func die():
	queue_free()


func _on_hit_timer_timeout():
	$AnimatedSprite2D.play("idle")
