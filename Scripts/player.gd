extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var pivot = $"Camera Origin"
@export var sensitivity = 0.5
@export var health: float = 100

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _process(delta):
	if Input.is_key_pressed(KEY_H):
		Connections.create_server()
	if Input.is_key_pressed(KEY_P):
		Connections.join_server()

func _physics_process(delta: float) -> void:
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
