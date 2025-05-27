extends Node3D

@onready var atlas = $atlas

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		get_tree().quit()
