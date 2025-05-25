extends CharacterBody3D

#walk and jump velocities
@export var speed = 13.125
@export var jump_velocity = 25.0
@export var sensitivity = 0.005
@export var dashes = 3
@export var DashTimer : NodePath

#jumping and gravity
var double_jump = true
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#Rotation
var last_direction = Vector3.FORWARD
@export var rotation_speed = 2
@onready var atlas_model = $xbot
@onready var camera = $SpringArm3D

func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		velocity.y -= gravity *delta
	
	#jumps
	if is_on_floor():
		double_jump = true
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_pressed("Jump") and !is_on_floor() and double_jump:
		velocity.y = jump_velocity * 0.5
		double_jump = false
	#Walking
	var input_direction = Input.get_vector("A","D","W","S")
	var direction = (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	direction = direction.rotated(Vector3.UP , camera.global_rotation.y)
	
	#movement
	if direction:
		last_direction = direction
		velocity.x = direction.x * speed 
		velocity.z = direction.z * speed 
	else:
		velocity.x = move_toward(velocity.x, 0, 2.5)
		velocity.z = move_toward(velocity.z, 0, 2.5)
	atlas_model.rotation.y = lerp_angle(atlas_model.rotation.y, atan2(last_direction.x, last_direction.z), delta * rotation_speed)
	
	#move and slide
	move_and_slide()
