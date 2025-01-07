extends Resource
class_name InventoryData

@export var slot_data: Array[SlotData]

func on_slot_clicked(index: int, button: int)-> void:
	print("Slot clicked")
