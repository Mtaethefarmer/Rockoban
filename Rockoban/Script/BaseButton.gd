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

export(String) var Name
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
	if(get_parent().has_method("GrowPawn")):
		get_parent().GrowPawn(position, Vector2.LEFT, Type)
	modulate = ColorN(ButtonColor)
	$Texture/Label.text = Name
	$Texture/Label.get("custom_fonts/font").size = FontSize
	$Texture/Label.set_anchors_and_margins_preset(Control.PRESET_CENTER)

