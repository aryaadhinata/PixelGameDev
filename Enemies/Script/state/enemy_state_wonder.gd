class_name EnemyStateWonder extends EnemyState

@export var anim_name : String = "walk"
@export var wonder_speed : float = 20.0

@export_category("AI")
@export var state_animation_duration : float = 0.5
@export var state_cycle_min : int = 1
@export var state_cycle_max : int = 3
@export var next_state : EnemyState

var _timer : float = 0.0
var _direction : Vector2

func init()-> void :
	pass

func Enter() -> void:
	_timer = randi_range(state_cycle_min, state_cycle_max) * state_animation_duration
	var rand = randi_range(0, 3)
	_direction = enemy.DIR_4[rand]
	enemy.velocity = _direction * wonder_speed
	enemy.SetDirection(_direction)
	enemy.UpdateAnimation(anim_name)
	pass

# what happen when player exit this state?
func  Exit() -> void:
	pass

# what happen during _process update in this state
func Process(_delta : float) -> EnemyState:
	_timer -= _delta
	if _timer <= 0 :
		return next_state
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> EnemyState:
	return null
