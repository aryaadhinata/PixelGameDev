class_name State_Idle extends State

@onready var walk: State_Walk = $"../walk"

# what happen when player enter this state?
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

# what happen when player exit this state?
func  Exit() -> void:
	pass

# what happen during _process update in this state
func Process(_delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> State:
	return null

# what happen with input event in this state
func HandleInput(_delta : InputEvent) -> State:
	return null
