class_name EnemyStateChase extends EnemyState

@export var anim_name : String = "chase"
@export var chase_speed : float = 20.0
@export var turn_rate : float = 0.25

@export_category("AI")
@export var vision_area : VisionArea
@export var attack_area : HurtBox
@export var state_agro_duration : float = 0.5
@export var next_state : EnemyState

var _timer : float = 0.0
var _direction : Vector2
var _can_see_player : bool = false

func init()-> void :
	if vision_area:
		vision_area.player_entered.connect(_on_player_enter)
		vision_area.player_exited.connect(_on_player_exit)
	pass

func Enter() -> void:
	_timer = state_agro_duration
	enemy.UpdateAnimation(anim_name)
	
	if attack_area:
		attack_area.monitoring = true
	pass

# what happen when player exit this state?
func  Exit() -> void:
	if attack_area:
		attack_area.monitoring = true
	pass

# what happen during _process update in this state
func Process(_delta : float) -> EnemyState:
	var new_dir : Vector2 = enemy.global_position.direction_to(PlayerMeneger.player.global_position)
	
	_direction = lerp(_direction, new_dir, turn_rate)
	enemy.velocity = _direction * chase_speed
	
	if enemy.SetDirection(_direction):
		enemy.UpdateAnimation(anim_name)
	
	if _can_see_player == false:
		_timer -= _delta
		if _timer <= 0 :
			return next_state
	else:
		_timer = state_agro_duration
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> EnemyState:
	return null

func _on_player_enter() -> void :
	_can_see_player = true
	
	if state_machine.curent_state is EnemyStateStunt:
		return
	state_machine.change_state(self)
	pass
	
func _on_player_exit() -> void :
	_can_see_player = false
	pass
