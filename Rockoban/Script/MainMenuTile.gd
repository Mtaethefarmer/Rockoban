extends "Pawn.gd"
################################################################################
#@file   MainMenuTile.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called MainMenuTile.
#
#		Operations include:
#        -
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	MainMenuTile
#@brief
#		Moves the player to the main menu screen
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	get_parent().GrowPawn(position, Vector2.LEFT, Type)