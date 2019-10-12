extends Node
################################################################################
#@file   JSONParser.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called JSONParser.
#
#		Operations include:
#        - Loading a JSON file into a Dictionary
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	JSONParser
#@brief
#		Tool used for reading and parsing JSON files
#
################################################################################
func _ready():
	pass

################################################################################
#@brief
#		Tool used for reading and parsing JSON files
#@param json
#			Filepath for the json file to be read
#@return
#		Contents of json file as a Dictionary
#
################################################################################
func LoadJSON(json):
	var file = File.new()
	file.open(json, File.READ)
	var LevelJSON = parse_json(file.get_as_text())
	if LevelJSON.empty():
		print("Unable to read JSON file: " + json)
	file.close()
	return LevelJSON

################################################################################
#@brief
#		Uses the information from a JSON file to create objects for a level
#@param filepath
#			Filepath for the JSON file to be read
#@return
#		An array of nodes to be instanced into the level
#
################################################################################
func CreateLevelFromJSON(filepath):
	var LevelJSON = LoadJSON(filepath)
	var TileArray = []
	for tile in LevelJSON:
		var instance = load(LevelJSON[tile]["path"]).instance()
		instance.position = Vector2.ZERO

		if LevelJSON[tile].has("name"):
			instance.name = LevelJSON[tile]["name"]

		if LevelJSON[tile].has("type"):
			instance.Type = LevelJSON[tile]["type"]

		if LevelJSON[tile].has("X") && LevelJSON[tile].has("Y"):
			instance.GridPosition.x = LevelJSON[tile]["X"]
			instance.GridPosition.y = LevelJSON[tile]["Y"]

		if LevelJSON[tile].has("id"):
			instance.Id = LevelJSON[tile]["id"]

		if LevelJSON[tile].has("color"):
			instance.modulate = ColorN(LevelJSON[tile]["color"])

		TileArray.append(instance)
	return TileArray