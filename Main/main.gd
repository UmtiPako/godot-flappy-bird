extends Control

@onready var highscore = $MC/HB/Highscore
# Called when the node enters the scene tree for the first time.
func _ready():
	highscore.text = str(GameManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Fly") == true:
		GameManager.load_game_scene()
