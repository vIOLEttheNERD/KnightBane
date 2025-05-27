extends CharacterBody3D
#Stats variabes
var max_speed : float
var dash_speed : float
var can_move : bool
#var mesh = Mesh

var alive = true
var stunned = false

#resources
@export var stats: EnemyStats

#Navigation variables
@export var atlas_path : NodePath
@onready var nav_agent = $NavigationAgent3D
var atlas = null

func _ready():
	atlas = get_node(atlas_path)
	
	max_speed = stats.max_speed
	dash_speed = stats.dash_speed
	can_move = stats.can_move
	
	#mesh = stats.mesh

#creates a vector between the enemy and the target position to get to atlas, then moves the enemy on that vector 
func _process(_delta):
	velocity = Vector3.ZERO
	
	#Navigation, creating the vector
	nav_agent.set_target_position(atlas.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * max_speed
	
	#makes the enemy look at the player
	look_at(Vector3(atlas.global_position.x, global_position.y, atlas.global_position.z))
	move_and_slide()
