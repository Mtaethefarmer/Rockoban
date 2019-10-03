extends "Pawn.gd"

signal CrateOnHole

func _ready():
	var err = connect("CrateOnHole", self, "onCrateOnHole")

	if(err):
		print(name + " encountered error code: " + String(err))

func onCrateOnHole():
	$Texture.frame = 45
