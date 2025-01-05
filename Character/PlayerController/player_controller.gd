extends Node3D
class_name PlayerController

@onready var player: PlayerCharacter = $Player
@onready var inventory_interface: InventoryInterface = $CanvasLayer/InventoryInterface


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_interface.set_player_inventory(player.inventory)
	player.toggle_inventory.connect(toggle_inventory)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggle_inventory()-> void:
	inventory_interface.visible = !inventory_interface.visible
	
	if inventory_interface.visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
