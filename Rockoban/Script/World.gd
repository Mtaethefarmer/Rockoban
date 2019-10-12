extends Node
################################################################################
#@file   World.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called World.
#
#		Operations include:
#		 -
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	World
#@brief
#		Starting point for the game
#
################################################################################
func _ready():
	#Connect signals to the instance of the crate
	var err = GlobalEvents.connect("GoToLevel", self, "onGoToLevel")

	if(err):
		print(name + " encountered error code: " + String(err))

	#Start and the Main Menu
	onGoToLevel(0)

################################################################################
#@brief
#		Load the specific into the game
#@param level
#		Number of the level to load
#
################################################################################
func onGoToLevel(level):
	var tiles = $JSONParser.CreateLevelFromJSON("res://Prefab/Level/Level00" + String(level) + ".json")

	for tile in tiles:
		$Grid.AddPawn(tile, Vector2(tile.GridPosition.x, tile.GridPosition.y), $Grid.cell_size/2)