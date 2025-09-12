extends CharacterBody3D

@export var speed : float = 10
@export var jump_power : float = 15
@export var gravity : float = 50

var direction : int

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_pressed("jump"):
			velocity.y = jump_power
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	direction = 0
	
	if Input.is_action_pressed("left"):
		direction -= 1
	if Input.is_action_pressed("right"):
		direction += 1
	
	velocity.x = direction * speed
	
	move_and_slide()
