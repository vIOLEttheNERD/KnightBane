extends Node3D
class_name HealthComponent

@export var MAX_HEALTH := 100
var health : float

func _ready():
	health = MAX_HEALTH 
	
func damage(attack: Attack):
	health -= attack.attack_damage
