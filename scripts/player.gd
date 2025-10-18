extends CharacterBody2D
var initial_p = Vector2(1089.0, 596.0)
var notfloor = 0.0
var gravity = 10000
var jump = -30000
const speed = 400
func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if notfloor >= 10.0:
		notfloor = 0.0
		position = initial_p
	if is_on_floor():
		notfloor = 0.0
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump
	move_and_slide()
