extends CharacterBody3D
#variables
var atlas = null
const speed = 7.0

#edining the navigation region
@export var atlas_path : NodePath
@onready var nav_agent = $NavigationAgent3D

func _ready():
	atlas = get_node(atlas_path)

#creates a vector between the enemy and the target position to get to atlas, then moves the enemy on that vector 
func _process(delta):
	velocity = Vector3.ZERO
	
	#Navigation, creating the vector
	nav_agent.set_target_position(atlas.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized()*speed
	
	#makes the enemy look at the player
	look_at(Vector3(atlas.global_position.x, global_position.y, atlas.global_position.z))
	move_and_slide()
