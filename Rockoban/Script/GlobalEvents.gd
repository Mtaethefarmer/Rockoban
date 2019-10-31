extends Node
################################################################################
#@file   GlobalEvents.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called GlobalEvents.
#
#		Events include:
#		 - PlayerControllerConnected
#@par
#		Discussion:
#		- [GD] Event singletons and other good programming practices:
#				"https://www.gdquest.com/open-source/guidelines/godot-gdscript/#using-an-event-singleton-to-avoid-spaghetti-code"
#
#
################################################################################

################################################################################
#@class	GlobalEvents
#@brief
#		Singleton class used for all global events
#
################################################################################
signal PlayerControllerConnected(id)
signal PlayerControllerDisconneted(id)
signal YouWin()
signal GoToMainMenu()
signal GoToLevel(level)
signal Pause()
signal UIButtonSelected()

var isPaused = false
var isWinner = false
var CurrentLevel = 0


enum TileType{	PLAYER = -2 ,
				OPEN,
				WALL,
				CRATE,
				HOLE,
				CONTINUE,
				LEVEL_SELECT,
				QUIT,
				MAIN_MENU,
				START,
				RESTART,
				OPTIONS,
				QUESTS,
				LEVEL
				}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

################################################################################
#@brief
#		Returns if players are currently on a level
#@note
#		All menus are negative values
#@return
#		Return true if players are currently on a level otherwise returns false
################################################################################
func isOnLevel():
	return CurrentLevel > 0