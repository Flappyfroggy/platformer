extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
var jump = -800.0
const speed = 200.0
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if notfloor >= 10.0:
		notfloor = 0.0
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		position = initial_p
		e.score = 1
	if is_on_floor():
		notfloor = 0.0
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump
	move_and_slide()
