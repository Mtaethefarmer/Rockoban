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

	err = GlobalEvents.connect("Pause", self, "OnPause")
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
	#Unpause the game
	GlobalEvents.isPaused = false

	#Check if level is not a Menu
	if level >= 0:
		GlobalEvents.CurrentLevel = level

	#Load the specified level
	var tiles = $JSONParser.CreateLevelFromJSON("res://Prefab/Level/Level00" + String(level) + ".json")

	if tiles:
		for tile in tiles:
			$Grid.AddPawn(tile, Vector2(tile.GridPosition.x, tile.GridPosition.y), tile.Offset)
	else:
		GlobalEvents.emit_signal("YouWin")

################################################################################
#@brief
#		Clear the level when game is paused
#@note  Level should be saved before clearing the board, tbh
################################################################################
func OnPause():
	if GlobalEvents.isPaused:
		$Grid.Clear()
		var tiles = $JSONParser.CreateLevelFromJSON("res://Resource/SaveData.json")
		for tile in tiles:
			print(tile.name)
			$Grid.AddPawn(tile, Vector2(tile.GridPosition.x, tile.GridPosition.y), tile.Offset)
	else:
		$JSONParser.SaveJSON($Grid.get_children())
		$Grid.Clear()
		onGoToLevel(-1)