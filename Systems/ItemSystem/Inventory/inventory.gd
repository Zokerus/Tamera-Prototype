extends PanelContainer
class_name Inventory

const SlotScene: PackedScene = preload("res://Systems/ItemSystem/Inventory/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

func _ready() -> void:
	var inv_data: InventoryData = preload("res://SaveGame/test_inventory.tres")
	fill_inventory(inv_data.slot_data)

func fill_inventory(slot_data: Array[SlotData])-> void:
	#clear current inventory
	for child in item_grid.get_children():
		child.queue_free()
		
	for data in slot_data:
		var slot = SlotScene.instantiate()
		item_grid.add_child(slot)
		
		if data:
			slot.set_slot_data(data)
