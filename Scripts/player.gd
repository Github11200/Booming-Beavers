extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var pivot = $"Camera Origin"
@export var sensitivity = 0.5

var rebound = true
var rebound2 = true

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("hi")

func _physics_process(delta: float) -> void:
	if not is_multiplayer_authority(): return
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
