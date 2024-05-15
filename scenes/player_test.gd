extends CharacterBody2D

const SPEED = 300.0
const VERTICAL_SPEED = 300.0
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	# Handle vertical movement.
	if Input.is_action_pressed("ui_up"):
		velocity.y = -VERTICAL_SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = VERTICAL_SPEED
	else:
		velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Animation
	if velocity.x != 0:
		sprite_2d.animation = "walking right"
	elif velocity.y < 0:
		sprite_2d.animation = "walking up"
	elif velocity.y > 0:
		sprite_2d.animation = "walking down"
	else:
		if velocity.y < 0:
			sprite_2d.animation = "idle up"
		elif velocity.y > 0:
			sprite_2d.animation = "idle down"
		else:
			sprite_2d.animation = "idle down" # Default idle animation


	# Handle sprite flipping
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
