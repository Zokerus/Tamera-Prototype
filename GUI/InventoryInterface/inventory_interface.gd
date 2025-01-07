extends Control
class_name InventoryInterface

@onready var player_inventory: Inventory = $PlayerInventory

func set_player_inventory(data: InventoryData)-> void:
	data.slot_interact.connect(on_slot_interact)
	player_inventory.fill_inventory(data)

func on_slot_interact(slot_data: SlotData, index: int, button: int)-> void:
	print("%s %s %s" % [slot_data, index, button])
