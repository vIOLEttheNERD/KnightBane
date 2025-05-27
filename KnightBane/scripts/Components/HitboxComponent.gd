extends MeshInstance3D
class_name HitboxComponent

var attack: Attack

#Getting damage and stun stats
@export var attack_damage : float
@export var stun_time : float

@export var Stats : EnemyStats

#Gives the information to the hurtbox
func _ready() -> void:
	Stats = Stats.duplicate()
	
	#Instantieates the attack object (Makes a new attack object that sends info to the hurtbox)
	attack = Attack.new()
	attack.attack_damage = Stats.damage
	attack.stun_time = Stats.stun
