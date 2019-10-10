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
#warning-ignore:unused_class_variable
export(GlobalEvents.TileType) var Type = GlobalEvents.TileType.OPEN
#warning-ignore:unused_class_variable
var GridPosition = Vector2()
################################################################################
#@class	Pawn
#@brief
#		Defines different types of tiles in game
#
################################################################################
func _ready():
	pass # Replace with function body.