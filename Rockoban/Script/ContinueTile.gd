extends "Pawn.gd"
################################################################################
#@file   ContinueTile.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called ContinueTile.
#
#		Operations include:
#        - Resume the game after being paused
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	ContinueTile
#@brief
#		Resume the game after being paused
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)
