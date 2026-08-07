class_name InventoryUI extends Control

const INVENTORY_SLOT = preload("res://Gui/PauseMenu/Inventory/inventory_slot.tscn")

@export var data : InventoryData

func _ready() -> void:
	PauseMenu.shown.connect(update_inventory)
	PauseMenu.hiden.connect(clear_inventory)
	clear_inventory()
	pass

func clear_inventory() -> void :
	for c in get_children():
		c.queue_free()
	pass

func update_inventory() -> void :
	for s in data.slots:
		var new_slots = INVENTORY_SLOT.instantiate()
		add_child(new_slots)
		new_slots.slot_data = s
	
	get_child(0).grab_focus()
	pass
