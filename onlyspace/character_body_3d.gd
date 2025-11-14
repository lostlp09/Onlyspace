extends CharacterBody3D

var Gravity = 10
@onready var Camera = $Node3D
const  jumppower = 8
var cameraxrotation = 0
var camerayrotation = 0 
var jump = false
var onfloor = true
@onready var area = $"../CSGMesh3D2/Area3D"
@onready var charartermesh:AnimationPlayer = $AuxScene.get_node("AnimationPlayer")

func _ready() -> void:

	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	cameraxrotation = self.rotation_degrees.x
	camerayrotation = Camera.rotation.y
func _physics_process(delta: float) -> void:
	if area.has_overlapping_bodies():
		
			for i in area.get_overlapping_bodies():

				if i == self and is_on_floor():
					print(i)
					self.velocity.y = 20
	
	if jump == false and not is_on_floor():
		onfloor = false

		charartermesh.play("falling")
	if jump == true and charartermesh.current_animation == "":
		charartermesh.play("falling")
	var sprinting = 1
	if Input.is_action_pressed("sprint"):
		sprinting = 2
	if Input.is_action_pressed("slow"):
		Engine.time_scale = 0.5
	else:
		Engine.time_scale = 1
	self.velocity.y -=10* delta 
	var leftright = Input.get_axis("left","right")
	var forwardbackward = Input.get_axis("forward","backwards")
	var direction = Vector3(leftright,0,forwardbackward)
	if direction.length() > 1:
		direction.normalized()
	direction = direction.rotated(Vector3.UP,self.rotation.y)
	self.velocity.z = direction.z * 500 *delta *sprinting 
	self.velocity.x = direction.x * 500 *delta * sprinting 
	if is_on_floor():
		onfloor = true
		jump = false
	if (leftright != 0 or forwardbackward != 0) and jump == false and onfloor == true:
		charartermesh.play("Running(1)1")

	elif jump == false and is_on_floor():
		charartermesh.play("Idle(1)0")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		charartermesh.play("mixamo_com")
		
		charartermesh.seek(0.23)
		jump = true	
		self.velocity.y = jumppower


	move_and_slide()



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:

		cameraxrotation -= event.relative.y * 0.1
		cameraxrotation = clamp(cameraxrotation,-44.5,80)
		Camera.rotation_degrees.x = cameraxrotation
		self.rotation.y -= event.relative.x *0.001
