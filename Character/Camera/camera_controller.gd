extends Node3D
class_name CameraController

@onready var v_pivot: Node3D = $vPivot
@onready var shape_cast_3d: ShapeCast3D = $vPivot/SpringArm3D/Node3D/Camera3D/ShapeCast3D


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

func _physics_process(delta: float) -> void:
	var object: Interactable = Get_Interactable()
	if object:
		print(object.name)
	
func Get_Interactable()-> Interactable:
	for i in shape_cast_3d.get_collision_count():
		if i > 0 and shape_cast_3d.get_collider(i) is PlayerCharacter:
			# ShapeCast3D detect the player itself
			return null
		if shape_cast_3d.get_collider(i).get_node_or_null("InteractComponent") is Interactable:
			return shape_cast_3d.get_collider(i).get_node_or_null("InteractComponent")
	
	return null
