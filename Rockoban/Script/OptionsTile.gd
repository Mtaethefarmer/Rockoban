extends "Pawn.gd"
################################################################################
#@file   OptionsTile.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called OptionsTile.
#
#		Operations include:
#		-
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	OptionsTile
#@brief
#		Moves the player to the Options Menu
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)