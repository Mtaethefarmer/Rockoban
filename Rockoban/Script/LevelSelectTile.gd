extends "Pawn.gd"
################################################################################
#@file   LevelSelectTile.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called LevelSelectTile.
#
#		Operations include:
#		-
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	LevelSelectTile
#@brief
#		Moves the player to the level select screen
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)
