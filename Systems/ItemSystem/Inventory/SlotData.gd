extends Resource
class_name SlotData

@export var item_data: ItemData
@export var quantity: int = 1: set = set_quantity

func set_quantity(value: int) -> void:
	quantity = value
	if quantity > 1 and !item_data.Stackable:
		quantity = 1

func can_merge_with(other_data: SlotData)-> bool:
	return (item_data == other_data.item_data and item_data.Stackable)
	
func merge(other_data: SlotData)-> void:
	quantity += other_data.quantity
