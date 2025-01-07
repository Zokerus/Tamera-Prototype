extends Resource
class_name InventoryData

@export var slot_data: Array[SlotData]

signal slot_interact(slot_data: SlotData, index: int, button: int)

func on_slot_clicked(index: int, button: int)-> void:
	slot_interact.emit(self.slot_data[index], index, button)
