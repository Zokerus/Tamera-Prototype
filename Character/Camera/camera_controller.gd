extends Node3D
class_name CameraController

@onready var v_pivot: Node3D = $vPivot
@onready var interactShapeCast: ShapeCast3D = $vPivot/SpringArm3D/Node3D/Camera3D/InteractShapeCast

signal interactable_detected(objectName: String)

@export var h_Sensetivity: float = 0.005
@export var v_Sensetivity: float = 0.005
@export var Invert_YAxis: bool = false

var lastDetectedObject: InteractComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#var mouseMotion: InputEventMouseMotion = event
		self.rotate_y(-event.relative.x * h_Sensetivity) #turn horizontally around the player
		v_pivot.rotate_x(-event.relative.y * v_Sensetivity) #turn vertically around the player
		v_pivot.rotation.x = clampf(v_pivot.rotation.x, -PI*0.25, PI*0.25)
	
	if event.is_action_pressed("Interact"):
		if lastDetectedObject:
			lastDetectedObject.interact_with()

func _process(delta: float) -> void:
	var object: InteractComponent = Get_Interactable()
	if object != lastDetectedObject:
		if !object:
			interactable_detected.emit("")
		else:
			interactable_detected.emit(object.get_parent().name)
		lastDetectedObject = object
		#print(object.get_parent().name)
	
func Get_Interactable()-> InteractComponent:
	for i in range(interactShapeCast.get_collision_count()):
		var collider: Object = interactShapeCast.get_collider(i)
		if collider:
			if i > 0 and collider is PlayerCharacter:
				# ShapeCast3D detect the player itself
				return null
			if collider.get_node_or_null("InteractComponent") is InteractComponent:
				return collider.get_node_or_null("InteractComponent")
	
	return null
