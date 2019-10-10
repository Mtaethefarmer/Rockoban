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
#warning-ignore:unused_signal
signal PlayerControllerConnected(id)
#warning-ignore:unused_signal
signal PlayerControllerDisconneted(id)
#warning-ignore:unused_signal
signal YouWin()
#warning-ignore:unused_signal
signal GoToMainMenu()
#warning-ignore:unused_signal
signal GoToLevel(level)

#warning-ignore:unused_class_variable
var isWinner = false


enum TileType{PLAYER = -2 , OPEN, WALL, CRATE, HOLE, CONTINUE, LEVEL_SELECT, QUIT, MAIN_MENU, START}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
