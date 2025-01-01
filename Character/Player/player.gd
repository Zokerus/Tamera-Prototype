extends CharacterBody3D
class_name PlayerCharacter

@export var mainCamera: CameraController

const SPEED = 3.0
const JUMP_VELOCITY = 4.5
const CHARACTER_ROTATION_RATE = 4*PI;

var movementDirection: Vector3 = Vector3.ZERO

func _ready() -> void:
	#Quit game if main camera is not ready yet
	if !mainCamera:
		get_tree().quit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	CalculateMovement(delta)
	if movementDirection != Vector3.ZERO:
		velocity.x = movementDirection.x * SPEED
		velocity.z = movementDirection.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	mainCamera.position = self.position

	move_and_slide()

func CalculateMovement(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
	movementDirection = (mainCamera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if movementDirection != Vector3.ZERO:
		#var rotation_Angle: float = -transform.basis.z.signed_angle_to(movementDirection, Vector3.UP)
		self.rotation.y = lerp_angle(self.rotation.y, atan2(-movementDirection.x, -movementDirection.z), CHARACTER_ROTATION_RATE * delta)
