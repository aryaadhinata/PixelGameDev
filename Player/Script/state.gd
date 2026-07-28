class_name State extends Node

# store reference to the player that this state belongs to
static var player : Player
static var state_machine : PlayerStateMechine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# what happens when we initialize this state
func init() -> void:
	pass

# what happen when player enter this state?
func Enter() -> void:
	pass

# what happen when player exit this state?
func  Exit() -> void:
	pass

# what happen during _process update in this state
func Process(_delta : float) -> State:
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> State:
	return null

# what happen with input event in this state
func HandleInput(_delta : InputEvent) -> State:
	return null
