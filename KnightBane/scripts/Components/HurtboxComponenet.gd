extends Area3D
class_name HurtboxComponent

#referencing the health
@export var health_component : HealthComponent

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

#managing the event of a hit
func _on_body_entered(body):
	#checks if an object is an attack
	if body is HitboxComponent:
		#defines the hitbox as the attack
		var hitbox = body as HitboxComponent
		#gets the info of the Hitbox's attack to give to health component
		var attack = hitbox.attack

		health_component.damage(attack)
