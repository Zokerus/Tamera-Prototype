extends Node3D
class_name CameraController

@onready var spring_arm_3d: SpringArm3D = $SpringArm3D2
@onready var v_pivot: Node3D = $vPivot

@export var h_Sensetivity: float = 0.005
@export var v_Sensetivity: float = 0.005
@export var Invert_YAxis: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#var mouseMotion: InputEventMouseMotion = event
		self.rotate_y(-event.relative.x * h_Sensetivity) #turn horizontally around the player
		v_pivot.rotate_x(-event.relative.y * v_Sensetivity) #turn vertically around the player
		v_pivot.rotation.x = clampf(v_pivot.rotation.x, -PI*0.25, PI*0.25) 
