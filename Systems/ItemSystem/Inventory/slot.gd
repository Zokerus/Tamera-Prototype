extends PanelContainer
class_name Slot

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect
@onready var lbl_quantity: Label = $lblQuantity

signal slot_clicked(index: int, button: int)

func set_slot_data(data: SlotData)-> void:
	texture_rect.texture = data.item_data.Icon
	tooltip_text = "%s\n%s" %[data.item_data.Name, data.item_data.Description]
	
	if data.quantity > 1:
		lbl_quantity.text = "x%s" % [data.quantity]
		lbl_quantity.show()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and (event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT) and event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)
