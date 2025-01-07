extends PanelContainer
class_name Inventory

const SlotScene: PackedScene = preload("res://Systems/ItemSystem/Inventory/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

func fill_inventory(inventory_data: InventoryData)-> void:
	#clear current inventory
	for child in item_grid.get_children():
		child.queue_free()
		
	for data in inventory_data.slot_data:
		var slot = SlotScene.instantiate()
		item_grid.add_child(slot)
		
		slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		
		if data:
			slot.set_slot_data(data)
