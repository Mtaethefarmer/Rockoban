extends "Pawn.gd"
################################################################################
#@file   Hole.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called Hole.
#
#		Operations include:
#        - Swapping textures when crate is moved onto hole
#@par
#		Discussion:
#
################################################################################

#warning-ignore:unused_signal
signal CrateOnHole

################################################################################
#@class	Hole
#@brief
#		Hole object that prevents the player from moving onto that tile unless
#		a crate is places on the tile
#
################################################################################
func _ready():
	var err = connect("CrateOnHole", self, "onCrateOnHole")

	if(err):
		print(name + " encountered error code: " + String(err))

################################################################################
#@brief
#		Swap to sunken crate texture when crate is above hole
################################################################################
func onCrateOnHole():
	$Texture.frame = 45
