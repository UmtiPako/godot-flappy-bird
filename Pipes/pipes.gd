extends Node2D

const SCROLL_SPEED: float = 150.0
@onready var scoring_sound = $ScoreSound
@onready var zurna_sound = $ZurnaSound
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta

func player_scored():
	zurna_sound.play()
	scoring_sound.play()
	GameManager.increment_score()

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group(GameManager.GROUP_ZURNA) == true:
		body.die()

func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_ZURNA) == true:
		player_scored()
