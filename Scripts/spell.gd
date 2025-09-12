class_name Spell

@export var name : String = ""
@export var keyBinding : String = ""
@export var damage : int = 0
@export var defense : int = 0
@export var scene: PackedScene

func create(name, keyBinding, damage, defense) -> Spell:
	self.name = name
	self.keyBinding = keyBinding
	self.damage = damage
	self.defense = defense
	return self
