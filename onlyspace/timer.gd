extends Label
var allow = true
@export var time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if allow == true:
		time += delta
		var timeasint = int(time)
		var oldtest = self.text
		var seconds = timeasint % 60
		var min = (timeasint/60) % 60
		var hour =(timeasint/3600) 
		self.text = "%02d:%02d:%02d" % [hour,min,seconds]


func _on_rocketarea_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		allow = false
