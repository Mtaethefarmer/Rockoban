extends "Pawn.gd"
################################################################################
#@file   Crate.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called Crate.
#
#		Operations include:
#        - Moving the crate on the grid
#		 - Sinking the crate into a hole
#@par
#		Discussion:
#
################################################################################

#warning-ignore:unused_signal
signal CrateMove(dir)
#warning-ignore:unused_signal
signal CrateSink(hole)

################################################################################
#@class	Crate
#@brief
#		Crate object that the player can move
#
################################################################################
func _ready():
	#Connect signals to the instance of the crate
	var err = connect("CrateMove", self, "onMoveTheCrate")

	if(err):
		print(name + " encountered error code: " + String(err))

	err= connect("CrateSink", self, "onSinkTheCrate")

	if(err):
		print(name + " encountered error code: " + String(err))

################################################################################
#@brief
#		Asks the grid to the move the crate in game
################################################################################
func onMoveTheCrate(dir):
	#Ask the grid for a new position
	var newPosition = get_parent().RequestMove(self, dir)

	#If the crate can move, set its new position
	if newPosition:
		position = newPosition

################################################################################
#@brief
#		Lets the game know that ca crate has sunk and needs to be removed
################################################################################
func onSinkTheCrate(hole):
	hole.emit_signal("CrateOnHole")
	#print( name + " sank into the hole.")
	get_parent().RemovePawn(self)