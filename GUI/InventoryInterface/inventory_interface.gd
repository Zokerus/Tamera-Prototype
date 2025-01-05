extends Control
class_name InventoryInterface

@onready var player_inventory: Inventory = $PlayerInventory

func set_player_inventory(data: InventoryData)-> void:
	player_inventory.fill_inventory(data.slot_data)
