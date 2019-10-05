extends "Pawn.gd"

func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)
