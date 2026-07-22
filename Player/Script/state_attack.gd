class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelarete_speed : float = 5.0

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation: AnimationPlayer = $"../../Sprite2D/AttackEfectSprite/AttackAnimation"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var idle: State_Idle = $"../idle"
@onready var walk: State_Walk = $"../walk"
@onready var hurt_box: HurtBox = $"../../Interaction/HurtBox"


# what happen when player enter this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_animation.play("attack_" + player.AnimationDirection())
	animation_player.animation_finished.connect(EndAttack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true
	
	hurt_box.monitoring = true
	await get_tree().create_timer(0.75).timeout
	pass

# what happen when player exit this state?
func  Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	hurt_box.monitoring = false
	pass

# what happen during _process update in this state
func Process(_delta : float) -> State:
	player.velocity -= player.velocity * decelarete_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

# what happen during _physics_process update in this state
func Physics(_delta : float) -> State:
	return null

# what happen with input event in this state
func HandleInput(_delta : InputEvent) -> State:
	return null

func EndAttack(_newAnimName : String) -> void:
	attacking = false
