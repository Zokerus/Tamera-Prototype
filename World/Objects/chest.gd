extends AnimatableBody3D
class_name Chest

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

func _open()-> void:
	animPlayer.stop()
	animPlayer.play("Open")

func _close()-> void:
	animPlayer.stop()
	animPlayer.play("Close")
