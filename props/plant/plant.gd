class_name Plant extends Node2D

const PICKUP = preload("res://Items/ItemPickUp/item_pick_up.tscn")

@export var drops : Array[DropData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HitBox.Damaged.connect(TakeDamage)
	pass # Replace with function body.

func TakeDamage(_hurt_box : HurtBox) -> void:
	drop_items()
	queue_free()

func drop_items() -> void:
	if drops.size() == 0:
		return

	for d in drops.size():
		if drops[d] == null or drops[d].item == null:
			continue

		var drop_count : int = drops[d].get_drop_count()
		for r in drop_count:
			var drop : ItemPickUp = PICKUP.instantiate() as ItemPickUp
			drop.item_data = drops[d].item

			get_parent().call_deferred("add_child", drop)
			drop.global_position = global_position + Vector2(randf() * 16, randf() * 16)
