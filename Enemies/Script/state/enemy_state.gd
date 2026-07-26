class_name EnemyState extends Node

## store a reference to the enemy that things belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine

func init()-> void :
	pass

func Enter() -> void:
	pass

# what happen when player exit this state?
func  Exit() -> void:
	pass

# what happen during _process update in this state
func Process(_delta : float) -> EnemyState:
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> EnemyState:
	return null
