extends Node3D
class_name HealthComponent

@export var STATS : EnemyStats
@export var MAX_HEALTH: float
var health : float

func _ready():
	MAX_HEALTH = STATS.max_health
	health = MAX_HEALTH
	
func damage(attack: Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		get_parent().queue_free()
