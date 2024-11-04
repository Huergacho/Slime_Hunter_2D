extends Node2D
@onready var navigation_region_2d: NavigationRegion2D = $NavigationRegion2D

func get_random_position():
	var vpr = navigation_region_2d.get_randomPoint()
