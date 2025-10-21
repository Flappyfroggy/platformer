extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = e.speed
	elif Input.is_action_pressed("left"):
		velocity.x = -e.speed
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if is_on_floor():
		notfloor = 0.0
	if notfloor >= 3:
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		position = initial_p
		e.fish = 0
		e.speed = 200.0
		e.jump = -800.0
		notfloor = 0
		e.score = 1
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = e.jump
	move_and_slide()
