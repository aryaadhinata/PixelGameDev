class_name Level extends Node2D



func _ready() -> void:
	self.y_sort_enabled = true
	PlayerMeneger.set_as_parent(self)
	LevelMeneger.level_load_started.connect(_free_level)
	pass

func _free_level() -> void :
	PlayerMeneger.unparent_player(self)
	queue_free()
	pass
