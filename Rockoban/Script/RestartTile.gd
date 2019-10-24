extends "Pawn.gd"
################################################################################
#@file   Restart.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called RestartTile.
#
#		Operations include:
#        -
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	RestartTile
#@brief
#		Resest the current level
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)
