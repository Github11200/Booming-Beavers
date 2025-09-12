extends CharacterBody3D

@export var speed : float = 10
@export var jump_power : float = 15
@export var gravity : float = 50

var direction : int
var spellStarted : bool = false
var spells : Array[Spell] = []

func _ready() -> void:
	# name, keybinding, damage, defense
	var vim = Spell.new().create("vim", "hjkl", 50, 0)
	spells.push_back(vim)

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
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("spellInit") and not spellStarted:
		spellStarted = true
	
	velocity.x = direction * speed
	
	move_and_slide()
