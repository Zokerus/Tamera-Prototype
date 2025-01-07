extends Resource
class_name InventoryData

@export var slot_data: Array[SlotData]

signal inventory_interact(inventory_data: InventoryData, index: int, button: int)
signal inventory_updated(inventory_data)

func on_slot_clicked(index: int, button: int)-> void:
	inventory_interact.emit(self, index, button)

func grab_slot_data(index: int)-> SlotData:
	var data: SlotData = slot_data[index]
	
	if data != null:
		slot_data[index] = null
		inventory_updated.emit(self)
		return data
	else:
		return null

func drop_slot_data(grabbed_data: SlotData, index: int)-> SlotData:
	var data: SlotData = slot_data[index]
	slot_data[index] = grabbed_data
	
	inventory_updated.emit(self)
	if data != null:
		return data
	else:
		return null
