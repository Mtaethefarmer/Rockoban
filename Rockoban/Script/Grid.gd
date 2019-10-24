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

const GRID_MAX_X = 15
const GRID_MAX_Y = 8
################################################################################
#@class	Grid
#@brief
#		Controls all logic for pawns on the grid
################################################################################
func _ready():
	pass

#warning-ignore:unused_argument
func _process(delta):
	#Debug active tiles on the grid
	if Input.is_action_just_pressed("ui_accept"):
		Print()

################################################################################
#@brief
#		Prints all active tiles on the grid
################################################################################
func Print():
	for x in range(GRID_MAX_X):
			for y in range(GRID_MAX_Y):
				if get_cellv(Vector2(x,y)) != GlobalEvents.TileType.OPEN and get_cellv(Vector2(x,y)) != GlobalEvents.TileType.WALL:
					print("Tile: " + String(get_cellv(Vector2(x,y))) + " @ {" + String(x) + ", " +String(y) + "}")

################################################################################
#@brief
#		Get a pawn grid position when given world coordinates
#@param position
#		Global position of the pawn
#@return
#		Position on the grid that the pawn is located
################################################################################
func GetPawnCellPosition(position):
	for child in get_children():
		if child.position == position:
			return world_to_map(position)

################################################################################
#@brief
#		Get a pawn when given grid position
#@param grid_position
#		Poisition in grid coordinates
#@return
#		Node at that grid position, NULL if no pawn was there
################################################################################
func GetPawn(grid_position):
	for child in get_children():
		if GetPawnCellPosition(child.position) == grid_position:
			return child
#		else:
#			print("Could not get pawn at grid position: " + String(grid_position))

################################################################################
#@brief
#		Expand a pawns size on the board
#@param position
#		Global position of the pawn
#@param direction
#		Which direction to grow the pawn in
#@param type
#		Type of tile
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
#param pawn
#		Pawn to be removed from the board
################################################################################
func RemovePawn(pawn):
	var cell_position = world_to_map(pawn.position)
	set_cellv(cell_position, GlobalEvents.TileType.OPEN)
	pawn.queue_free()

################################################################################
#@brief
#		Move a pawn on the board.
#		Handles most of the logic for moving things on the board
#@param pawn
#		Pawn that is requesting to be moved on the grid
#@param direction
#		Direction that the pawn wants to move in
#@return
#		New global position that the pawn moves to, or NULL if pawn did not move
################################################################################
func RequestMove(pawn, direction):
	#Both are in grid coords
	var start = world_to_map(pawn.position)
	var target = start + direction

	match get_cellv(target):
		GlobalEvents.TileType.RESTART:
			Clear()
			GlobalEvents.emit_signal("GoToLevel", GlobalEvents.CurrentLevel)
		GlobalEvents.TileType.OPEN:
			return UpdatePawnPosition(pawn, start, target)
		GlobalEvents.TileType.CONTINUE:
			print("Player has chosen to continue...")
			GlobalEvents.emit_signal("Pause")
		GlobalEvents.TileType.LEVEL_SELECT:
			print("Player has chosen to select another level...")
		GlobalEvents.TileType.START:
			print("Player has chosen to start the game...")
			Clear()
			GlobalEvents.emit_signal("GoToLevel", 1)
		GlobalEvents.TileType.MAIN_MENU:
			Clear()
			GlobalEvents.emit_signal("GoToLevel", 0)
		GlobalEvents.TileType.PLAYER:
			if pawn.Type == GlobalEvents.TileType.PLAYER:
				if not GlobalEvents.isWinner:
					Clear()
				GlobalEvents.emit_signal("YouWin")
		GlobalEvents.TileType.CRATE:
			if pawn.Type == GlobalEvents.TileType.CRATE:
				continue
			else:
				var crate = GetPawn(target)
				if crate:
					crate.emit_signal("CrateMove", direction)
				else:
					print("Could not move crate because crate was not there.")
		GlobalEvents.TileType.HOLE:
			if pawn.Type == GlobalEvents.TileType.CRATE:
				var hole = GetPawn(target)
				pawn.emit_signal("CrateSink", hole)
				set_cellv(target, GlobalEvents.TileType.OPEN)

################################################################################
#@brief
#		Clear the board of all pawns
################################################################################
func Clear():
	print("Clearing the board")
	#Set every cell to open
	for x in range(GRID_MAX_X):
			for y in range(GRID_MAX_Y):
				if x != 0 && y != 0 && x != GRID_MAX_X + 1 && y != GRID_MAX_Y + 1:
					set_cellv(Vector2(x,y), GlobalEvents.TileType.OPEN)

	#Remove any children of the grid
	for child in get_children():
			remove_child(child)
			child.queue_free()

################################################################################
#@brief
#		Set a pawn's position on the board
#@param pawn
#		Pawn that is requesting to be moved on the grid
#@param start
#		Current location of the pawn in grid coordinates
#@param target
#		Requested location in grid coordinates
#@return
#		New location in world coordinates
################################################################################
func UpdatePawnPosition(pawn, start, target):
		set_cellv(target, pawn.Type)
		set_cellv(start, GlobalEvents.TileType.OPEN)
		return map_to_world(target) + (cell_size/2)

################################################################################
#@brief
#		Add a pawn to the board
#@param pawn
#		Request pawn to tadd to the grid
#@param gridPosition
#		Location on the grid
#@param offset
#		For tiles whose textures need to be aligned on the board correctly
################################################################################
func AddPawn(pawn, gridPosition, offset = Vector2.ZERO):
	#Print error if not within the bounds of the grid
	if gridPosition.x >= GRID_MAX_X && gridPosition.y >= GRID_MAX_Y:
		print("Could not place Pawn: [" + pawn.name + "] @ GridPos: " + String(gridPosition))
		print("~Outside of Grid.")
		return

	#Print error if grid position is occupied
	if get_cellv(gridPosition) == GlobalEvents.TileType.OPEN:
		#This assumes the pawn is already instanced and has a GridType
		pawn.position = map_to_world(gridPosition) + offset
		add_child(pawn)
		set_cellv(gridPosition, pawn.Type)
	else:
		print("Could not place Pawn: [" + pawn.name + "] @ GridPos: " + String(gridPosition))
		print("~Tile " + GetPawn(gridPosition).name + " with type: " + String(GetPawn(gridPosition).Type) + " is blocking.")

