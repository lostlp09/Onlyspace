extends Node3D

@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("forward") or Input.is_action_pressed("backwards") :
		animation.active = true
		if not animation.is_playing() :
			animation.play("mixamo_com")
	else:
		animation.active = false
