extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health
@onready var pop_sound = $pop
@onready var die_sound = $die  


# constants
const SPEED = 110.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 200.0
const DASH_TIME = 0.2

# jump variables
var jump_count = 0 
var max_jumps = 2
# dash variable
var dashing = false 
var dash_timer = 0.0 

# death variables
@onready var death_timer: Timer = $Timer
var respawn_point: Vector2
var is_dead = false




func _ready() -> void:
	add_to_group("Player")
	respawn_point = global_position


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
	
	if Input.is_action_just_pressed("dash"):
		dashing = true
		dash_timer = DASH_TIME
	if Input.is_action_just_pressed("dash"):
		dashing = true
		dash_timer = DASH_TIME

	# Play animations
	if dashing:
		animated_sprite.play("dash")
	elif is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	
	if direction:
		if dashing: 
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_health_depleted() -> void:
	if is_dead:
		return

	is_dead = true
	print("You died!")
	set_physics_process(false)
	animated_sprite.play("death")
	Engine.time_scale = 0.5
	death_timer.wait_time = 0.6
	death_timer.start()
	die_sound.play()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	death_timer.stop()
	global_position = respawn_point
	health.set_health(health.get_max_health())
	velocity = Vector2.ZERO
	dashing = false
	dash_timer = 0.0
	jump_count = 0
	is_dead = false
	animated_sprite.play("idle")
	set_physics_process(true)
