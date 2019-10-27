extends "Pawn.gd"
################################################################################
#@file   BaseButton.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called BaseButton.
#
#		Operations include:
#        -
#@par
#		Discussion:
#
################################################################################

#warning-ignore:unused_class_variable
export(String) var Name
#warning-ignore:unused_class_variable
export(int) var FontSize = 18
export(String) var ButtonColor = "white"
################################################################################
#@class	BaseButton
#@brief
#		Node that all buttons inherit features from
#		This tile takes up 2 spaces
#			[ ,x]
#			x = starting position on the board
################################################################################
func _ready():
	modulate = ColorN(ButtonColor)