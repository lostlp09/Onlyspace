extends Node3D

var number = -1
@export var angle = 90
var time = 0.03
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotateobject()


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func rotateobject():

	while true:

		number += 1
		self.rotation_degrees.x= sin(number * time) *angle
		await  get_tree().create_timer(0.01).timeout


func _on_rocketarea_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
