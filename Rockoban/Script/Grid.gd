extends TileMap

enum TileType{PLAYER = -2 , OPEN, WALL, BOX, HOLE}

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.Type)
		print(child.Type)

func GetPawnCellPosition(position):
	for child in get_children():
		if child.position == position:
			return world_to_map(position)
		else:
			print("Could not find cell @ position: " + position)

func RequestMove(pawn, direction):
	#Both are in map coords
	var start = world_to_map(pawn.position)
	var target = start + direction

	match get_cellv(target):
		TileType.OPEN:
			return UpdatePawnPosition(pawn, start, target)
		TileType.PLAYER:
			return UpdatePawnPosition(pawn, start, target)

func UpdatePawnPosition(pawn, start, target):
		set_cellv(target, pawn.Type)
		set_cellv(start, TileType.OPEN)
		return map_to_world(target) + (cell_size/2)