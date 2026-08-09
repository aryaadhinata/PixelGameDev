class_name ItemEffectsHeal extends ItemEffects

@export var heal_amount : int = 1
@export var audio : AudioStream

func use() -> void :
	PlayerMeneger.player.update_hp(heal_amount)
	PauseMenu.play_audio(audio)
	pass
