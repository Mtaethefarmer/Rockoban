extends TileMap
################################################################################
#@file   Grid.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called Grid.
#
#		Operations include:
#        - Get a pawn grid position when given world coordinates
#		 - Get a pawn when given grid position
#		 - Expand a pawns size on the board
#		 - Remove a pawn from the board
#		 - Move a pawn on the board
#		 - Clear the board of all pawns
#		 - Add a pawn to the board
#		 - Set a pawn's position on the board
#@par
#		Discussion:
#		 - Positions swapped between global and grid positions
################################################################################

################################################################################
#@class	Grid
#@brief
#		Controls all logic for pawns on the grid
#
################################################################################
func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.Type)
		print(String(child.Type) + " World Pos: " + String(child.position) + " Grid Pos: " + String(world_to_map(child.position)))

################################################################################
#@brief
#		Get a pawn grid position when given world coordinatesS
################################################################################
func GetPawnCellPosition(position):
	for child in get_children():
		if child.position == position:
			return world_to_map(position)

################################################################################
#@brief
#		Get a pawn when given grid position
################################################################################
func GetPawn(grid_position):
	for child in get_children():
		if GetPawnCellPosition(child.position) == grid_position:
			return child

################################################################################
#@brief
#		Expand a pawns size on the board
################################################################################
func GrowPawn(position, direction, type):
	var start = world_to_map(position)
	var target = start + direction

	if get_cellv(target) == GlobalEvents.TileType.OPEN:
		set_cellv(target, type)
	else:
		print("Cannot grow tile, not an open tile. " + String(get_cellv(target)) + " exsists @: " + String(target))

################################################################################
#@brief
#		Remove a pawn from the board
################################################################################
func RemovePawn(pawn):
	var cell_position = world_to_map(pawn.position)
	set_cellv(cell_position, GlobalEvents.TileType.OPEN)
	pawn.queue_free()

################################################################################
#@brief
#		Move a pawn on the board.
#		Handles most of the logic for moving things on the board
################################################################################
func RequestMove(pawn, direction):
	#Both are in grid coords
	var start = world_to_map(pawn.position)
	var target = start + direction

	match get_cellv(target):
		GlobalEvents.TileType.OPEN:
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.CONTINUE:
			print("Player has chosen to continue...")
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.LEVEL_SELECT:
			print("Player has chosen to select another level...")
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.START:
			print("Player has chosen to start the game...")
			Clear(true)
			GlobalEvents.emit_signal("GoToLevel", 1)
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.MAIN_MENU:
			Clear(false)
			GlobalEvents.emit_signal("GoToMainMenu")
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.PLAYER:
			if pawn.Type == GlobalEvents.TileType.PLAYER:
				if not GlobalEvents.isWinner:
					Clear(false)
				GlobalEvents.emit_signal("YouWin")
		GlobalEvents.TileType.CRATE:
			var crate = GetPawn(target)
			if crate:
				crate.emit_signal("CrateMove", direction)
		GlobalEvents.TileType.HOLE:
			if pawn.Type == GlobalEvents.TileType.CRATE:
				var hole = GetPawn(target)
				pawn.emit_signal("CrateSink", hole)
				set_cellv(target, GlobalEvents.TileType.OPEN)

################################################################################
#@brief
#		Clear the board of all pawns
#@param isAllTiles
#		boolean value of whether or not exclude players when clearing the board
#		of all tiles
################################################################################
func Clear(isAllTiles = true):
	for x in range(15):
			for y in range(8):
				if x != 0 && x != 15 && y != 0 && y != 8:
					var tile = get_cellv(Vector2(x,y))
					if tile != GlobalEvents.TileType.PLAYER:
						set_cellv(Vector2(x,y), GlobalEvents.TileType.OPEN)
	for child in get_children():
		if isAllTiles:
			child.queue_free()
		else:
			if child.Type != GlobalEvents.TileType.PLAYER:
				child.queue_free()


################################################################################
#@brief
#		Set a pawn's position on the board
################################################################################
func UpdatePawnPosition(pawn, start, target):
		set_cellv(target, pawn.Type)
		set_cellv(start, GlobalEvents.TileType.OPEN)
		return map_to_world(target) + (cell_size/2)

################################################################################
#@brief
#		Add a pawn to the board
################################################################################
func AddPawn(pawn, gridPosition, offset = Vector2.ZERO):
	#Print error if grid position is occupied
	if get_cellv(gridPosition) == GlobalEvents.TileType.OPEN:
		#This assumes the pawn is already instanced and has a GridType
		pawn.position = map_to_world(gridPosition) + offset
		add_child(pawn)
		set_cellv(gridPosition, pawn.Type)
	else:
		print("Could not place Pawn: [" + pawn.name + "] @ GridPos: " + String(gridPosition))