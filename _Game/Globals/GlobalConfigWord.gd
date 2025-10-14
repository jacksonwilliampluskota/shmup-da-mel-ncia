extends Node

var grid:Array = []
var grid_width:int = 5
var grid_height:int = 5
var tile_size:int = 100

enum grid_spawnable_enimies {  
	GRID_1 = 1,
	GRID_2 = 2,      
	GRID_3 =3,      
	GRID_4 = 4,      
	GRID_5 = 5      
}

var main_world:GridPoint
