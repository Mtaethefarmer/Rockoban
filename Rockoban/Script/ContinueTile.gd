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
#
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)
