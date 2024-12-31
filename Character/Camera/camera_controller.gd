extends Node3D
class_name CameraController

@onready var spring_arm_3d: SpringArm = $SpringArm3D

@export var h_Sensetivity: float = 0.005
@export var v_Sensetivity: float = 0.005
@export var Invert_YAxis: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#var mouseMotion: InputEventMouseMotion = event
		self.rotate_y(-event.relative.x * h_Sensetivity) #turn horizontally around the player
		spring_arm_3d.rotate_x(-event.relative.y * v_Sensetivity) #turn vertically around the player
		spring_arm_3d.rotation.x = clampf(spring_arm_3d.rotation.x, -PI*0.25, PI*0.25) 
