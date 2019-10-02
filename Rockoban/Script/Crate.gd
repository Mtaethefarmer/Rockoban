extends "Pawn.gd"

signal CrateMove(dir)

func _ready():
	var err = connect("CrateMove", self, "onMoveTheCrate")

	if(err):
		print(name + " encountered error code: " + String(err))

func onMoveTheCrate(dir):
	var newPosition = get_parent().RequestMove(self, dir)

	if newPosition:
		print("Moved the crate.")
		position = newPosition
