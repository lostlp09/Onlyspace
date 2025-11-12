extends CharacterBody3D

var Gravity = 10
@onready var Camera = $Node3D
const  jumppower = 20
var cameraxrotation = 0
var camerayrotation = 0 

func _ready() -> void:
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	cameraxrotation = self.rotation_degrees.x
	camerayrotation = Camera.rotation.y
func _physics_process(delta: float) -> void:
	self.velocity.y -= 60 * delta
	var leftright = Input.get_axis("left","right")
	var forwardbackward = Input.get_axis("forward","backwards")
	var direction = Vector3(leftright,0,forwardbackward)
	if direction.length() > 1:
		direction.normalized()
	direction = direction.rotated(Vector3.UP,self.rotation.y)
	self.velocity.z = direction.z * 500 *delta
	self.velocity.x = direction.x * 500 *delta
	
	
	
	

	if Input.is_action_just_pressed("jump"):
		self.velocity.y = jumppower


	move_and_slide()



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:

		cameraxrotation -= event.relative.y * 0.1
		cameraxrotation = clamp(cameraxrotation,-44.5,32)
		Camera.rotation_degrees.x = cameraxrotation
		self.rotation.y -= event.relative.x *0.001
