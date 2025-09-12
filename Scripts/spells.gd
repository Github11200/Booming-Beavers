class_name Spells

var spells : Dictionary[String, Spell] = {}

func addSpell(spell: Spell):
	spells[spell.keyBinding] = spell

func checkKeyBind(currentKeyPresses: String):
	return spells.has(currentKeyPresses)
