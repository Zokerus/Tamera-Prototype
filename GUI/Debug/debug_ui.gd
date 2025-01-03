extends Control
class_name DebugUI

@export var player: PlayerCharacter

@onready var label: Label = $Label
@onready var interactable: Label = $Interactable
@onready var wood_number: Label = $HBoxContainer/WoodNumber

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_position: Vector3 = player.global_position
	label.text = "Player Position: (%.2f, %.2f, %.2f)\n" % [player_position.x, player_position.y, player_position.z]
	label.text += "Player Direction: %.2f\n" % [player.rotation_degrees.y]
	label.text += "Player Velocity: (%.2f, %.2f, %.2f)\n" % [player.velocity.x, player.velocity.y, player.velocity.z]
	label.text += "Player Speed: %.2f\n" % [player.movementSpeed]
	#label.text += "Movement Direction: (%.2f, %.2f)\n" % [player.movementDirection.x, player.movementDirection.z]


func SetInteractable(objectName: String) -> void:
	if objectName.length() > 0:
		interactable.text = objectName
		interactable.show()
	else:
		interactable.hide()

func AddWood() -> void:
	var number: int = int(wood_number.text)
	wood_number.text = str(number + 1)
