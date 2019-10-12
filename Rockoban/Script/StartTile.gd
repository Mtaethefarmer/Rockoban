extends "Pawn.gd"
################################################################################
#@file   StartTile.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called StartTile.
#
#		Operations include:
#        -
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	StartTile
#@brief
#		Moves the player to Level 1
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)