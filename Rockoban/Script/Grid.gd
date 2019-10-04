extends TileMap

#Positions swapped between global and grid positions

enum TileType{PLAYER = -2 , OPEN, WALL, CRATE, HOLE, WIN, RESTART, LOSE}

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.Type)
		print(String(child.Type) + " World Pos: " + String(child.position) + " Grid Pos: " + String(world_to_map(child.position)))

func GetPawnCellPosition(position):
	for child in get_children():
		if child.position == position:
			return world_to_map(position)
#		else:
#			print("Could not find cell @ position: " + String(position))

func GetPawn(grid_position):
	for child in get_children():
		if GetPawnCellPosition(child.position) == grid_position:
			return child
#		else:
#			print("Could not find pawn @ positon: " + String(position))

func RemovePawn(pawn):
	var cell_position = world_to_map(pawn.position)
	set_cellv(cell_position, TileType.OPEN)
	pawn.queue_free()

func RequestMove(pawn, direction):
	#Both are in grid coords
	var start = world_to_map(pawn.position)
	var target = start + direction

	match get_cellv(target):
		TileType.OPEN:
			return UpdatePawnPosition(pawn, start, target)
		TileType.PLAYER:
			if pawn.Type == TileType.PLAYER:
				GlobalEvents.emit_signal("YouWin")
				if not GlobalEvents.isWinner:
					Clear()
		TileType.CRATE:
			var crate = GetPawn(target)
			if crate:
				crate.emit_signal("CrateMove", direction)
		TileType.HOLE:
			if pawn.Type == TileType.CRATE:
				var hole = GetPawn(target)
				pawn.emit_signal("CrateSink", hole)
				set_cellv(target, TileType.OPEN)

func Clear():
	for x in range(15):
			for y in range(8):
				if x != 0 && x != 15 && y != 0 && y != 8:
					var tile = get_cellv(Vector2(x,y))
					if tile != TileType.PLAYER:
						set_cellv(tile, TileType.OPEN)
	for child in get_children():
		if child.Type != TileType.PLAYER:
			child.queue_free()

func UpdatePawnPosition(pawn, start, target):
		set_cellv(target, pawn.Type)
		set_cellv(start, TileType.OPEN)
		return map_to_world(target) + (cell_size/2)