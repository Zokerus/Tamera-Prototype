extends Control
class_name InventoryInterface

@onready var player_inventory: Inventory = $PlayerInventory
@onready var grabbed_slot: Slot = $GrabbedSlot

var grabbed_slot_data: SlotData  #May be deleted

func _process(delta: float) -> void:
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5)

func set_player_inventory(data: InventoryData)-> void:
	data.inventory_interact.connect(on_inventory_interact)
	data.inventory_updated.connect(player_inventory.fill_inventory)
	player_inventory.fill_inventory(data)

func set_grabbed_slot()-> void:  #may use varibles
	if grabbed_slot_data != null:
		grabbed_slot.set_slot_data(grabbed_slot_data)
		grabbed_slot.show()
	else:
		grabbed_slot.hide()

func on_inventory_interact(inventory_data: InventoryData, index: int, button: int)-> void:
	if grabbed_slot_data == null and button == MOUSE_BUTTON_LEFT:
		grabbed_slot_data = inventory_data.grab_slot_data(index)
		
	set_grabbed_slot()
