extends CharacterBody2D

# signal on_plane_died
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
const GRAVITY: float = 1500.0
const POWER: float = -300.0
var dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor() == true and dead == false:
		die()


func fly() -> void:
	if Input.is_action_just_pressed("Fly") == true:
		velocity.y = POWER
		animation_player.play("Bounce")
		
func die() -> void:
	if dead == true:
		return
	dead = true
	animated_sprite_2d.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)



