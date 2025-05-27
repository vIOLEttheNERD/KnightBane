extends Area3D
class_name WeaponComponent

@export var STATS: EnemyStats

var attack_damage : float
var stun_time : float

func _ready():
	attack_damage = STATS.damage
	stun_time = STATS.stun
	
func _on_hitbox_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.attack_position = global_position
		attack.stun_time = stun_time
		
		hitbox.damage(attack)
		print("Dealt Damage :)")
