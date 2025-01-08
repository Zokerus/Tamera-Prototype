extends Resource
class_name InventoryData

@export var slot_data: Array[SlotData]

signal inventory_interact(inventory_data: InventoryData, index: int, event: InputEvent)
signal inventory_updated(inventory_data)

func on_slot_clicked(index: int, event: InputEvent)-> void:
	inventory_interact.emit(self, index, event)

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
	
	if slot_data[index] != null and slot_data[index].can_merge_with(grabbed_data):
		slot_data[index].merge(grabbed_data)
		data = null
	else:
		slot_data[index] = grabbed_data
	
	inventory_updated.emit(self)
	return data

func drop_single_slot_data(grabbed_data: SlotData, index: int)-> SlotData:
	var data: SlotData = slot_data[index]
	
	if data == null:
		slot_data[index] = grabbed_data.create_single_slot_data()
	elif data != null and slot_data[index].can_merge_with(grabbed_data):
		slot_data[index].quantity += 1
		grabbed_data.quantity -= 1
	
	inventory_updated.emit(self)
	if grabbed_data.quantity > 0:
		return grabbed_data
	else:
		return null
