class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle: State_Idle = $"../idle"
@onready var attack: State_Attack = $"../attack"

# what happen when player enter this state?
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

# what happen when player exit this state?
func  Exit() -> void:
	pass

# what happen during _process update in this state
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> State:
	return null

# what happen with input event in this state
func HandleInput(_event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed(("interact")):
		PlayerMeneger.interact_press.emit()
	return null
