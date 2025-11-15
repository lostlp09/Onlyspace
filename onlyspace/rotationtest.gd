extends Node3D

var number = -1
var time = 0.03
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotateobject()


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func rotateobject():

	while true:

		number += 1
		self.rotation_degrees.x= sin(number * time) *90
		await  get_tree().create_timer(0.01).timeout
