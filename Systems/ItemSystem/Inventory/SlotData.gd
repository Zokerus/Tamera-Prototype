extends Resource
class_name SlotData

@export var item_data: ItemData
@export var quantity: int = 1: set = set_quantity

func set_quantity(value: int) -> void:
	quantity = value
	if quantity > 1 and !item_data.Stackable:
		quantity = 1
