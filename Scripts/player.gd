extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var bullet: PackedScene
@export var sensitivity = 0.5

var rebound = true
var rebound2 = true

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _input(event):
	if event is InputEventMouseButton:
		var newBullet = bullet.instantiate()
		add_child(newBullet)
		var origin_y = event.global_position.y - 648
		var origin_x = event.global_position.x - 1152
		
	if event is InputEventMouseMotion:
		print(event.global_position)
		
		#look_at(Vector3(event.global_position.x, 0, event.global_position.y))
		#rotate_y(deg_to_rad(event.relative.x * sensitivity))
		#pivot.rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		#pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _physics_process(_delta: float) -> void:
	#if not is_multiplayer_authority(): return
	
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
