extends CharacterBody3D
class_name PlayerCharacter

@export var mainCamera: CameraController
@export var inventory: InventoryData

const SPEED: float = 5.0 
const JUMP_VELOCITY: float = 4.5
const CHARACTER_ROTATION_RATE: float = 4 * PI 
const ACCELERATION: float = 6.0

var movementDirection: Vector3 = Vector3.ZERO
var lastMovementDirection: Vector3 = Vector3.ZERO #To track last direction when stop moving (inertia)
var movementSpeed: float = 0.0

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
		movementSpeed = lerpf(movementSpeed, SPEED, ACCELERATION * delta)
		velocity.x = movementDirection.x * movementSpeed
		velocity.z = movementDirection.z * movementSpeed
	else:
		movementSpeed = lerpf(movementSpeed, 0, ACCELERATION * delta)
		velocity.x = lastMovementDirection.x * movementSpeed
		velocity.z = lastMovementDirection.z * movementSpeed

	move_and_slide()
	mainCamera.position = self.position

func CalculateMovement(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
	movementDirection = (mainCamera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if movementDirection != Vector3.ZERO:
		self.global_rotation.y = lerp_angle(self.global_rotation.y, atan2(-movementDirection.x, -movementDirection.z), CHARACTER_ROTATION_RATE * delta)
		lastMovementDirection = movementDirection
