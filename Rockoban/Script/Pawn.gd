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
export(GlobalEvents.TileType) var Type = GlobalEvents.TileType.OPEN
var GridPosition = Vector2()
var Offset = Vector2()
################################################################################
#@class	Pawn
#@brief
#		Defines different types of tiles in game
#
################################################################################
func _ready():
	pass # Replace with function body.

################################################################################
#@brief
#		Storing all pawn data in a dictionary
#@return
#		All pawn data as a dictionary
#@note By default all pawns will save their name, scene path, position and
#		thier tile type
#@note Check for valid parameters, not all Pawns have the same info
################################################################################
func Save():
	var save_data={
		"name": name,
		"path": filename,
		"type": Type,
		"X": get_parent().GetPawnCellPosition(position).x,
		"Y": get_parent().GetPawnCellPosition(position).y,
		"offsetX": Offset.x,
		"offsetY": Offset.y
	}
	#print(save_data)
	return save_data