extends Node

signal on_game_over
signal on_score_updated
const GROUP_ZURNA: String = "zurna"
var game_scene: PackedScene = preload("res://Game/game.tscn")
var main_scene: PackedScene = preload("res://Main/main.tscn")
var _score: int = 0
var _high_score: int = 0


func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _high_score
	
func set_score(v: int):
	_score = v
	if _score > _high_score:
		_high_score = _score
	on_score_updated.emit()

func increment_score():
	set_score(_score + 1)
