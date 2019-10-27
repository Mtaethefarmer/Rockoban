extends "BaseButton.gd"

export(int) var Level = -2

func _ready():
	#get_parent().GrowPawn(position, Vector2.LEFT, Type)
	$Texture/Label.text = String(Level)
	$Texture/Label.get("custom_fonts/font").size = FontSize
	$Texture/Label.set_anchors_and_margins_preset(Control.PRESET_CENTER)

################################################################################
#@brief
#		Stores all level button data in a dictionary
#@return
#		All level button data as a dictionary
#@note By default all buttons will save their name, scene path, position, tile
#		type, font size, color, and the number of the level
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
		"offsetY": Offset.y,
		"level" : Level,
		"fontSize": FontSize,
		"color": ButtonColor
	}
	#print(save_data)
	return save_data