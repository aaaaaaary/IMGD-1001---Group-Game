extends CharacterBody2D


const SPEED = 110.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 350.0
const DASH_TIME = 0.2


var jump_count = 0 
var max_jumps = 2
var dashing = false 
var dash_timer = 0.0 

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		jump_count=0
		
	if dashing:
		dash_timer -=delta
		
		if dash_timer <= 0:
			dashing = false

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count+=1

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move left", "move right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if Input.is_action_just_pressed("dash"):
		dashing = true 
		dash_timer = DASH_TIME
		
	
	if direction:
		if dashing: 
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
