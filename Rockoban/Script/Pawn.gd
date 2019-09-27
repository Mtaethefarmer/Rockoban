extends Node2D
################################################################################
#@file   Pawn.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called Pawn.
#
#		Operations include:
#        - Exposing the Tile Type
#@par
#		Discussion:
#		 - [GD] Exposing the tile type in a global script does not allow it to
#				be changed the editor
#
################################################################################
enum TileType{INVALID = -1, OPEN, PLAYER, WALL}
#warning-ignore:unused_class_variable
export(TileType) var Type = TileType.INVALID
################################################################################
#@class	Pawn
#@brief
#		Defines different types of tiles in game
#
################################################################################
func _ready():
	pass # Replace with function body.