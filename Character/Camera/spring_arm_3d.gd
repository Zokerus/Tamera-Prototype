extends Node3D
class_name SpringArm

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var camera_3d: Camera3D = $Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_3d.is_colliding():
		camera_3d.position.z = minf(ray_cast_3d.global_position.distance_to(ray_cast_3d.get_collision_point()) - 0.1, 3.0)
	else:
		camera_3d.position.z = 3
