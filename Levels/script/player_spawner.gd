extends Node2D

func _ready() -> void:
	visible = false
	if PlayerMeneger.player_spawned == false :
		PlayerMeneger.set_player_position(global_position)
		PlayerMeneger.player_spawned = true
	pass 
