extends Node

const SAVE_PATH = "user://"

signal game_loaded
signal game_saved

var current_save : Dictionary = {
	scene_path = "",
	player = {
		hp = 1,
		max_hp = 1,
		pos_x = 0,
		pos_y = 0
	},
	item = [],
	persistence = [],
	quest = []
}

func save_game() -> void :
	update_player_data()
	update_sync_path()
	update_item_data()
	
	var file := FileAccess.open(SAVE_PATH + "save.sav", FileAccess.WRITE)
	var save_json = JSON.stringify(current_save)
	file.store_line(save_json)
	game_saved.emit()
	pass

func load_game() -> void :
	var file := FileAccess.open(SAVE_PATH + "save.sav", FileAccess.READ)
	var load_json := JSON.new()
	load_json.parse(file.get_line())
	var save_dict : Dictionary = load_json.get_data() as Dictionary
	current_save = save_dict
	
	LevelMeneger.load_new_level(current_save.scene_path, "", Vector2.ZERO)
	await LevelMeneger.level_load_started
	
	PlayerMeneger.set_player_position(Vector2(current_save.player.pos_x, current_save.player.pos_y))
	PlayerMeneger.set_health(current_save.player.hp, current_save.player.max_hp)
	PlayerMeneger.INVENTORY_DATA.parse_save_data(current_save.item)
	
	await LevelMeneger.level_loaded
	
	game_loaded.emit()
	pass

func update_player_data() -> void :
	var p : Player = PlayerMeneger.player
	current_save.player.hp = p.hp
	current_save.player.max_hp = p.max_hp
	current_save.player.pos_x = p.global_position.x
	current_save.player.pos_y = p.global_position.y
	pass

func update_sync_path() -> void :
	var p : String = ""
	for c in get_tree().root.get_children():
		if c is Level:
			p = c.scene_file_path
	
	current_save.scene_path = p
	pass

func update_item_data() -> void:
	current_save.item = PlayerMeneger.INVENTORY_DATA.get_save_data()
	pass
