extends TileMap

enum TileType{PLAYER = -2 , OPEN, WALL, CRATE, HOLE}

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.Type)
		print(child.Type)

func GetPawnCellPosition(position):
	for child in get_children():
		if child.position == position:
			return world_to_map(position)
		else:
			print("Could not find cell @ position: " + String(position))

func GetPawn(grid_position):
	for child in get_children():
		if GetPawnCellPosition(child.position) == grid_position:
			return child
		else:
			print("Could not find pawn @ positon: " + String(position))

func RequestMove(pawn, direction):
	#Both are in grid coords
	var start = world_to_map(pawn.position)
	var target = start + direction

	match get_cellv(target):
		TileType.OPEN:
			return UpdatePawnPosition(pawn, start, target)
#		TileType.PLAYER:
#			return UpdatePawnPosition(pawn, start, target)
		TileType.CRATE:
			var crate = GetPawn(target)
			crate.emit_signal("CrateMove", direction)

func UpdatePawnPosition(pawn, start, target):
		set_cellv(target, pawn.Type)
		set_cellv(start, TileType.OPEN)
		return map_to_world(target) + (cell_size/2)