extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous fram


func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		body.queue_free()
		var endscreen= $"../../Control".get_node("TextureRect")
		endscreen.visible = true
		
		
		
		$"../../Control/Label".time
