extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health
@onready var pop_sound = $pop 
@onready var run_sound = $run


# constants
const SPEED = 110.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 350.0
const DASH_TIME = 0.2

# jump variables
var jump_count = 0 
var max_jumps = 2
# dash variable
var dashing = false 
var dash_timer = 0.0 



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
		pop_sound.play()



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
			run_sound.play()
	else:
		animated_sprite.play("jump")
		pop_sound.play()
	
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
